To simplify event handling and delegation in PL/SQL code, STDLIB introduces the `std_event` struct. It contains all essential context information such as current block, current item, form name etc. 

Instead of directly accessing slippery `SYSTEM` variables, you can just get the whole context of current event by initializing new struct with `std_event.new('CURRENT-EVENT-NAME')` call like this:

``` sql
declare
  lc_event constant std.event := std_event.new('WHEN-NEW-ITEM-INSTANCE');
begin
  fnd_message.debug(lc_event.block.name);
end;
```

## Recommended convention for new form modules

PL/SQL packages inside the form library:

### `main.pks`

``` sql
create or replace package main as
  
  procedure event(p_event in std.event);
  
end main;
```

### `main.pkb`

``` sql
create or replace package body main as

  procedure initialize_form;

  procedure event(p_event in std.event) is
  begin
    if p_event.name = 'WHEN-NEW-FORM-INSTANCE' then
      initialize_form;
      return;
    end if;

    --- other
  end event;

  procedure initialize_form is
  begin
    --- some initialization logic
    
    null;
  end event;

begin
  fdrcsid('$Id$');
end main;
```

### `event_router.pks`

``` sql
create or replace package event_router as
  
  procedure event;

  procedure event(p_event_name in varchar2);
  
end event_router;
```

### `event_router.pkb`

``` sql
create or replace package body event_router as

  procedure event is
    l_event std.event := std_global_event.pop();
  begin
    if not std_event.is_null(l_event) then
      route(l_event);
    end if;
  end event;

  procedure event(p_event_name varchar2) is
  begin
    route(std_event.new(p_event_name));
  end event;

  procedure route(p_event in std.event) is
  begin
    -- delegate other events from here to other packages
    
    /* Example:

    item_list_ctrl.event(p_event);
    request_creator_ctrl.event(p_event);

    */
  end route;
  
begin
  fdrcsid('$Id$');
end event_router; 

```

`event_router` package is responsible only for event delegation and should not contain any complex business logic.

`main` package should contain logic which doesn't really fall into some other, less generic feature group. A good example is form initialization, pre-configuration, opening developer tools etc.

In order to put all of this to work, the `event_router.event('<EVENT NAME>');` call should be added to all triggers of the form module (preferably at the form level, although in some cases it might be needed to define trigger on block or item level due to weird bugs).

### Sample: `form` package

`form` is a package with specification only, body is not needed. It is used to describe physical structure of the form in PL/SQL code using structs provided by STDLIB. 

``` sql
create or replace package form as


  type t_form_items;
  type t_form_blocks;
  type t_form_canvases;
  type t_form_tab_pages;
  type t_form_visual_attributes;
  type t_form_windows;

  type b_item_list;
  type b_item_controls


  -- Main exports

  items t_form_items;
  blocks t_form_blocks;
  canvases t_form_canvases;
  vattrs t_form_visual_attributes;
  windows t_form_windows;


  -- Definitons

  type t_form_items is record (
    item_list b_item_list,
    item_controls b_item_controls
  );

  type t_form_blocks is record (
    item_list std.block := std_block.new('item_list'),
    item_controls std.block := std_block.new('item_controls')
  );

  type t_form_canvases is record (
    main std.canvas := std_canvas.new('main')
  );

  type t_form_visual_attributes is record (
    pick_status_in_progress std.vattr := std_vattr.new('pick_status_in_progress'),
    pick_status_completed std.vattr := std_vattr.new('pick_status_completed'),
    status_released std.vattr := std_vattr.new('status_released')
  );

  type b_item_list is record (
    item_number std.item := std_item.new('item_list.item_number'),
    inventory_item_id std.item := std_item.new('item_list.inventory_item_id'),
    quantity std.item := std_item.new('item_list.quantity')
  );

  type b_item_controls is record (
    complete std.item := std_item.new('item_controls.complete'),
    cancel std.item := std_item.new('item_controls.cancel')
  );

  type t_form_windows is record (
    main_window std.window := std_window.new('main_window')
  );
  
end form;
```


### Sample: `item_list_ctrl` package

This is just an example package which demonstrates how to manage execution flow based on current context information.

``` sql
create or replace package body item_list_ctrl as

  procedure close_modal;
  procedure validate_quantity;
  procedure complete;
  function is_quantity_too_high return boolean;

  procedure event(p_event in std.event) is
  begin    
    case p_event.name 
      when 'KEY-EXIT' then
        if std_block.is_in(
          p_event.block, 
          form.blocks.item_list, 
          form.blocks.item_controls
        )
        then
          close_modal();
        end if;
      when 'WHEN-VALIDATE-ITEM' then
        if std_item.equals(p_event.item, form.items.item_list.quantity) then
          validate_quantity();
        end if;
      when 'WHEN-BUTTON-PRESSED' then
        if std_item.equals(p_event.item, form.items.item_controls.complete) then
          complete();
        elsif std_item.equals(p_event.item, form.items.item_controls.cancel) then
          close_modal();
        end if;
      else
        null;
    end case p_event#name;

    ...
  end event;

end item_list_ctrl;

```