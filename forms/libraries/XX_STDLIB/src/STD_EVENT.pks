CREATE OR REPLACE PACKAGE STD_EVENT IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_EVENT_NAME IS VARCHAR2(500);

  TYPE STD_EVENT_TAB_PAGE_INFO;

  TYPE STD_EVENT IS RECORD (
    -- Name of event / trigger
    NAME STD_EVENT_NAME,
    
    BLOCK STD_BLOCK.STD_BLOCK,
    ITEM STD_ITEM.STD_ITEM,

    /**
     * Note: CURRENT_BLOCK is included for compatibility with previous versions. Oracle
     * Corporation recommends that you use CURSOR_BLOCK and TRIGGER_BLOCK
     * instead.
     *
     * Value depends on the current navigation unit:
     *
     * - If the current navigation unit is the block, record, or item (as in the Pre- and Post- Item, Record, and
     *   Block triggers), the value of CURRENT_BLOCK is the name of the block that Form
     *   Builder is processing or that the cursor is in.
     *
     * - If the current navigation unit is the form (as in the Pre- and Post-Form triggers), the value of
     *   CURRENT_BLOCK is NULL.
     */
    -- CURRENT_BLOCK OBJECT_NAME,

    /**
     * Represents the name of the form that Form Builder is executing
     */
    -- CURRENT_FORM OBJECT_NAME,

    /**
     * Note: CURRENT_ITEM is included for compatibility with previous versions. Oracle
     * Corporation recommends that you use CURSOR_ITEM or TRIGGER_ITEM
     * instead.
     *
     * Value depends on the current navigation unit:
     *
     * - If the current navigation unit is the item (as in the Pre- and Post-Item triggers), the value of
     *   CURRENT_ITEM is the name of the item that Form Builder is processing or that the
     *   cursor is in. The returned item name does not include a block name prefix.
     *
     * - If the current navigation unit is the record, block, or form (as in the Pre- and Post- Record, Block,
     *   and Form triggers), the value of CURRENT_ITEM is NULL.
     */
    -- CURRENT_ITEM OBJECT_NAME,

    /**
     * Note: CURRENT_VALUE is included for compatibility with previous versions. Oracle
     * Corporation recommends that you use CURSOR_ITEM and CURSOR_VALUE
     * instead.
     *
     * Represents the value of the item that is registered in CURRENT_ITEM.
     */
    -- CURRENT_VALUE OBJECT_NAME,

    /**
     * Value depends on the current navigation unit:
     *
     * - If the current navigation unit is the block, record, or item (as in the Pre- and Post- Item, Record, and
     *   Block triggers), the value of CURSOR_BLOCK is the name of the block where the cursor
     *   is located.
     *
     * - If the current navigation unit is the form (as in the Pre- and Post-Form triggers), the value of
     *   CURSOR_BLOCK is NULL
     */
    -- CURSOR_BLOCK OBJECT_NAME,

    /**
     * Represents the name of the block and item, block.item, where the input focus
     * (cursor) is located.
     */
    -- CURSOR_ITEM VARCHAR2(61),

    /**
     * Represents the number of the record where the cursor is located. This
     * number represents the record’s current physical order in the block’s list of records. The value is always a
     * character string.
     */
    -- CURSOR_RECORD OBJECT_NAME,

    /**
     * Event-specific information describing tab pages transition (WHEN-TAB-PAGE-CHANGED)
     */
    TAB_PAGE STD_EVENT_TAB_PAGE_INFO

    /**
     * Event-specific. Represents the name of the last window that was
     * affected by an action that caused one of the window event triggers to fire. The following triggers cause
     * this variable to be updated:
     *
     * - WHEN-WINDOW-ACTIVATED
     * - WHEN-WINDOW-CLOSED
     * - WHEN-WINDOW-DEACTIVATED
     * - WHEN-WINDOW-RESIZED
     */
    -- WINDOW STD_TYPE.OBJECT_NAME

    /**
     * Represents the status of the current form. The value can be one of three form properties:
     *
     *  - CHANGED Indicates that the form contains at least one block with a Changed
     *    record. The value of SYSTEM.FORM_STATUS becomes
     *    CHANGED only after at least one record in the form has been changed
     *    and the associated navigation unit has also changed.
     * 
     *  - NEW Indicates that the form contains only New records.
     *    
     *  - QUERY Indicates that a query is open. The form contains at least one block
     *    with QUERY records and no blocks with CHANGED records.
     */
    -- FORM_STATUS NUMBER
  );
  
  TYPE STD_EVENT_TAB_PAGE_INFO IS RECORD (
    NEW STD_TYPE.TAB_PAGE_NAME,
    PREVIOUS STD_TYPE.TAB_PAGE_NAME
  );

	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_EVENT_NAME IN VARCHAR2) RETURN STD_EVENT;
	
END STD_EVENT;