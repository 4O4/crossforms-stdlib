CREATE OR REPLACE PACKAGE STD_ITEM IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
  
  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_ITEM IS STD_STRUCTURE.STD_ITEM;

  
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_FULL_ITEM_NAME IN STD_TYPE.FULL_ITEM_NAME) RETURN STD_ITEM;

  FUNCTION IS_NULL(P_ITEM IN STD_ITEM) RETURN BOOLEAN;

  FUNCTION IS_VALUE_NULL(P_ITEM IN STD_ITEM) RETURN BOOLEAN;

  FUNCTION EQUALS(
    P_ITEM_1 IN STD_ITEM, 
    P_ITEM_2 IN STD_ITEM
  ) RETURN BOOLEAN;

  FUNCTION IS_IN(
    P_ITEM IN STD_ITEM, 
    P_TEST_ITEM_1 IN STD_ITEM, 
    P_TEST_ITEM_2 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_3 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_4 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_5 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_6 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_7 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_8 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_9 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_10 IN STD_ITEM DEFAULT NULL
  ) RETURN BOOLEAN;

  FUNCTION VALUE(P_ITEM IN STD_ITEM) RETURN VARCHAR2;

  FUNCTION GET_VALUE(P_ITEM IN STD_ITEM) RETURN VARCHAR2;

  PROCEDURE SET_VALUE(P_ITEM IN STD_ITEM, P_VALUE IN VARCHAR2);

  FUNCTION NUMBER_VALUE(P_ITEM IN STD_ITEM) RETURN NUMBER;

  FUNCTION GET_NUMBER_VALUE(P_ITEM IN STD_ITEM) RETURN NUMBER;

  PROCEDURE SET_NUMBER_VALUE(P_ITEM IN STD_ITEM, P_VALUE IN NUMBER);

  PROCEDURE COPY_VALUE(P_ITEM IN STD_ITEM, P_COPY_FROM_ITEM IN STD_ITEM);

  PROCEDURE FOCUS(P_ITEM IN STD_ITEM);

  PROCEDURE GO(P_ITEM IN STD_ITEM);


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the Automatic Hint property is set to Yes, and the VARCHAR2 string FALSE if it is set to No.
  --  */
  -- FUNCTION AUTO_HINT RETURN VARCHAR2;
  -- FUNCTION GET_AUTO_HINT RETURN VARCHAR2;
  
  -- PROCEDURE SET_AUTO_HINT;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if Automatic Skip is set to Yes for the item, and the string FALSE if it is set to No for the item.
  --  */
  -- FUNCTION AUTO_SKIP RETURN VARCHAR2;
  -- FUNCTION GET_AUTO_SKIP RETURN VARCHAR2;
  
  -- PROCEDURE SET_AUTO_SKIP;


  -- /**
  --  * The color of the object's background region.
  --  */
  -- FUNCTION BACKGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_BACKGROUND_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_BACKGROUND_COLOR;


  /**
   * Returns the VARCHAR2 block name for the item.
   */
  -- FUNCTION BLOCK_NAME RETURN VARCHAR2;
  -- FUNCTION GET_BLOCK_NAME RETURN VARCHAR2;


  -- /**
  --  * Returns RAISED, LOWERED, or PLAIN if the BORDER_BEVEL property is set to RAISED, LOWERED, or PLAIN, respectively at the item level.
  --  */
  -- FUNCTION BORDER_BEVEL RETURN VARCHAR2;
  -- FUNCTION GET_BORDER_BEVEL RETURN VARCHAR2;
  
  -- PROCEDURE SET_BORDER_BEVEL;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if this property is set to Yes for the item, and the string FALSE if the property is set to No.
  --  */
  -- FUNCTION CASE_INSENSITIVE_QUERY RETURN VARCHAR2;
  -- FUNCTION GET_CASE_INSENSITIVE_QUERY RETURN VARCHAR2;
  
  -- PROCEDURE SET_CASE_INSENSITIVE_QUERY;


  -- /**
  --  * Returns UPPERCASE if text for the item is to display in upper case, LOWERCASE if the text is to display in lower case, or NONE if no case restriction is in force.
  --  */
  -- FUNCTION CASE_RESTRICTION RETURN VARCHAR2;
  -- FUNCTION GET_CASE_RESTRICTION RETURN VARCHAR2;
  
  -- PROCEDURE SET_CASE_RESTRICTION;


  -- /**
  --  * Returns the name of the column in the database to which the datablock item is associated.
  --  */
  -- FUNCTION COLUMN_NAME RETURN VARCHAR2;
  -- FUNCTION GET_COLUMN_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_COLUMN_NAME;


  -- /**
  --  * Returns a value (either TRUE or FALSE) that indicates whether the sound object being read into a form from a file should be compressed when converting to the Oracle internal format.
  --  */
  -- FUNCTION COMPRESS# RETURN VARCHAR2;
  -- FUNCTION GET_COMPRESS RETURN VARCHAR2;
  
  -- PROCEDURE SET_COMPRESS;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the text an operator types into the text item is to be hidden, and the VARCHAR2 string FALSE if the text an operator types into the text item is to be displayed.
  --  */
  -- FUNCTION CONCEAL_DATA RETURN VARCHAR2;
  -- FUNCTION GET_CONCEAL_DATA RETURN VARCHAR2;
  
  -- PROCEDURE SET_CONCEAL_DATA;


  /**
   * Returns the VARCHAR2 name of the named visual attribute of the given item.
   */
  -- FUNCTION CURRENT_RECORD_ATTRIBUTE RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_RECORD_ATTRIBUTE RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_RECORD_ATTRIBUTE;


  /**
   * The color of the object’s background region.
   */
  -- FUNCTION CURRENT_ROW_BACKGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION CURRENT_ROW_BG_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_BG_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_BG_COLOR;


  -- /**
  --  * The pattern to be used for the object’s fill region. Patterns are rendered in the two colors specified by Background Color and Foreground Color.
  --  */
  -- FUNCTION CURRENT_ROW_FILL_PATTERN RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FILL_PATTERN RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_FILL_PATTERN;


  -- /**
  --  * The font family, or typeface, that should be used for text in the object. The list of fonts available is systemdependent.
  --  */
  -- FUNCTION CURRENT_ROW_FONT_NAME RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FONT_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_FONT_NAME;


  -- /**
  --  * The size of the font, specified in points.
  --  */
  -- FUNCTION CURRENT_ROW_FONT_SIZE RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FONT_SIZE RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_FONT_SIZE;


  -- /**
  --  * The width of the font, that is, the amount of space between characters (kerning).
  --  */
  -- FUNCTION CURRENT_ROW_FONT_SPACING RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FONT_SPACING RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_FONT_SPACING;


  -- /**
  --  * The style of the font.
  --  */
  -- FUNCTION CURRENT_ROW_FONT_STYLE RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FONT_STYLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_FONT_STYLE;


  -- /**
  --  * The weight of the font.
  --  */
  -- FUNCTION CURRENT_ROW_FONT_WEIGHT RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FONT_WEIGHT RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_FONT_WEIGHT;


  /**
   * The color of the object’s foreground region. For items, the Foreground Color attribute defines the color of text displayed in the item.
   */
  -- FUNCTION CURRENT_ROW_FOREGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION CURRENT_ROW_FG_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FG_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_FG_COLOR;


  -- /**
  --  * Specifies that the object is to appear on a monochrome bitmap display device as white text on a black background.
  --  */
  -- FUNCTION CURRENT_ROW_WHITE_ON_BLACK RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_WHITE_ON_BLACK RETURN VARCHAR2;
  
  -- PROCEDURE SET_CURRENT_ROW_WHITE_ON_BLACK;


  -- /**
  --  * For a base table item, returns the value that was originally fetched from the database.
  --  */
  -- FUNCTION DATABASE_VALUE RETURN VARCHAR2;
  -- FUNCTION GET_DATABASE_VALUE RETURN VARCHAR2;
  
  -- PROCEDURE SET_DATABASE_VALUE;


  -- /**
  --  * Returns the data type of the item: ALPHA, CHAR, DATE, JDATE, EDATE, DATETIME, INT, RINT, MONEY, RMONEY, NUMBER, RNUMBER, TIME, LONG, GRAPHICS, or IMAGE. Note that some item types, such as buttons and charts, do not have data types. To avoid an error message in these situations, screen for item type before getting data type.
  --  */
  -- FUNCTION DATATYPE RETURN VARCHAR2;
  -- FUNCTION GET_DATATYPE RETURN VARCHAR2;
  
  -- PROCEDURE SET_DATATYPE;


  -- /**
  --  * Returns the layout direction for bidirectional objects. Valid return values are RIGHT_TO_LEFT, LEFT_TO_RIGHT.
  --  */
  -- FUNCTION DIRECTION RETURN VARCHAR2;
  -- FUNCTION GET_DIRECTION RETURN VARCHAR2;
  
  -- PROCEDURE SET_DIRECTION;


  -- /**
  --  * Returns the VARCHAR2 string TRUE or FALSE.
  --  */
  -- FUNCTION DISPLAYED RETURN VARCHAR2;
  -- FUNCTION GET_DISPLAYED RETURN VARCHAR2;
  
  -- PROCEDURE SET_DISPLAYED;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the Conceal Data property is set to No for the item, and the VARCHAR2 string FALSE if the Conceal Data property is set to Yes for the item.
  --  */
  -- FUNCTION ECHO RETURN VARCHAR2;
  -- FUNCTION GET_ECHO RETURN VARCHAR2;
  
  -- PROCEDURE SET_ECHO;


  -- /**
  --  * Returns the name of the editor attached to the text item.
  --  */
  -- FUNCTION EDITOR_NAME RETURN VARCHAR2;
  -- FUNCTION GET_EDITOR_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_EDITOR_NAME;


  -- /**
  --  * Returns the x coordinate of the editor attached to the text item. (Corresponds to the Editor Position property.)
  --  */
  -- FUNCTION EDITOR_X_POS RETURN VARCHAR2;
  -- FUNCTION GET_EDITOR_X_POS RETURN VARCHAR2;
  
  -- PROCEDURE SET_EDITOR_X_POS;


  -- /**
  --  * Returns the y coordinate of the editor attached to the edit item. (Corresponds to the Editor Position property.)
  --  */
  -- FUNCTION EDITOR_Y_POS RETURN VARCHAR2;
  -- FUNCTION GET_EDITOR_Y_POS RETURN VARCHAR2;
  
  -- PROCEDURE SET_EDITOR_Y_POS;


  -- /**
  --  * Returns the name of the item whose value is copied to this item as a foreign key when a new record is created as part of a masterdetail relation. (Corresponds to the Copy property.)
  --  */
  -- FUNCTION ENFORCE_KEY RETURN VARCHAR2;
  -- FUNCTION GET_ENFORCE_KEY RETURN VARCHAR2;
  
  -- PROCEDURE SET_ENFORCE_KEY;


  /**
   * Returns BOOLEAN TRUE if enabled property is set to Yes, BOOLEAN FALSE if set to No.
   */
  FUNCTION ENABLED(P_ITEM IN STD_ITEM) RETURN BOOLEAN;
  FUNCTION GET_ENABLED(P_ITEM IN STD_ITEM) RETURN BOOLEAN;
  
  PROCEDURE SET_ENABLED(P_ITEM IN STD_ITEM, P_ENABLED IN BOOLEAN);


  -- /**
  --  * The pattern to be used for the object’s fill region. Patterns are rendered in the two colors specified by Background Color and Foreground Color.
  --  */
  -- FUNCTION FILL_PATTERN RETURN VARCHAR2;
  -- FUNCTION GET_FILL_PATTERN RETURN VARCHAR2;
  
  -- PROCEDURE SET_FILL_PATTERN;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the property is set to Yes for the item, and the VARCHAR2 string FALSE if the property is set to No for the item.
  --  */
  -- FUNCTION FIXED_LENGTH RETURN VARCHAR2;
  -- FUNCTION GET_FIXED_LENGTH RETURN VARCHAR2;
  
  -- PROCEDURE SET_FIXED_LENGTH;


  -- /**
  --  * The font family, or typeface, that should be used for text in the object. The list of fonts available is system-dependent.
  --  */
  -- FUNCTION FONT_NAME RETURN VARCHAR2;
  -- FUNCTION GET_FONT_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_FONT_NAME;


  -- /**
  --  * The size of the font, specified in hundredths of a point (i.e., an item with a font size of 8 points will return 800).
  --  */
  -- FUNCTION FONT_SIZE RETURN VARCHAR2;
  -- FUNCTION GET_FONT_SIZE RETURN VARCHAR2;
  
  -- PROCEDURE SET_FONT_SIZE;


  -- /**
  --  * The width of the font, that is, the amount of space between characters (kerning).
  --  */
  -- FUNCTION FONT_SPACING RETURN VARCHAR2;
  -- FUNCTION GET_FONT_SPACING RETURN VARCHAR2;
  
  -- PROCEDURE SET_FONT_SPACING;


  -- /**
  --  * The style of the font.
  --  */
  -- FUNCTION FONT_STYLE RETURN VARCHAR2;
  -- FUNCTION GET_FONT_STYLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_FONT_STYLE;


  -- /**
  --  * The weight of the font.
  --  */
  -- FUNCTION FONT_WEIGHT RETURN VARCHAR2;
  -- FUNCTION GET_FONT_WEIGHT RETURN VARCHAR2;
  
  -- PROCEDURE SET_FONT_WEIGHT;


  -- /**
  --  * The color of the object’s foreground region. For items, the Foreground Color attribute defines the color of text displayed in the item.
  --  */
  -- FUNCTION FOREGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_FOREGROUND_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_FOREGROUND_COLOR;


  -- /**
  --  * Returns the format mask used for the text item.
  --  */
  -- FUNCTION FORMAT_MASK RETURN VARCHAR2;
  -- FUNCTION GET_FORMAT_MASK RETURN VARCHAR2;
  
  -- PROCEDURE SET_FORMAT_MASK;


  /**
   * Returns the height of the item. The size of the units depends on the Coordinate System and default font scaling you specified for the form.
   */
  FUNCTION HEIGHT(P_ITEM IN STD_ITEM) RETURN NUMBER;
  FUNCTION GET_HEIGHT(P_ITEM IN STD_ITEM) RETURN NUMBER;

  PROCEDURE SET_HEIGHT(P_ITEM IN STD_ITEM, P_HEIGHT IN NUMBER);


  -- /**
  --  * Returns the item-specific help text displayed on the message line at runtime.
  --  */
  -- FUNCTION HINT_TEXT RETURN VARCHAR2;
  -- FUNCTION GET_HINT_TEXT RETURN VARCHAR2;
  
  -- PROCEDURE SET_HINT_TEXT;


  -- /**
  --  * Returns the file name of the icon resource associated with a button item having the iconic property set to TRUE.
  --  */
  -- FUNCTION ICON_NAME RETURN VARCHAR2;
  -- FUNCTION GET_ICON_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_ICON_NAME;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the button is defined as iconic, and the VARCHAR2 value FALSE if it is not an iconic button.
  --  */
  -- FUNCTION ICONIC_BUTTON RETURN VARCHAR2;
  -- FUNCTION GET_ICONIC_BUTTON RETURN VARCHAR2;
  
  -- PROCEDURE SET_ICONIC_BUTTON;


  -- /**
  --  * Returns the color depth of the specified image item.
  --  */
  -- FUNCTION IMAGE_DEPTH RETURN VARCHAR2;
  -- FUNCTION GET_IMAGE_DEPTH RETURN VARCHAR2;
  
  -- PROCEDURE SET_IMAGE_DEPTH;


  -- /**
  --  * Returns the format of the specified image item.
  --  */
  -- FUNCTION IMAGE_FORMAT RETURN VARCHAR2;
  -- FUNCTION GET_IMAGE_FORMAT RETURN VARCHAR2;
  
  -- PROCEDURE SET_IMAGE_FORMAT;


  /**
   * Returns the BOOLEAN TRUE if the INSERT_ALLOWED property is set to true at the item level. Returns the BOOLEAN FALSE if the property is set to false.
   */
  FUNCTION INSERT_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN;
  FUNCTION GET_INSERT_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN;
  
  PROCEDURE SET_INSERT_ALLOWED(P_ITEM IN STD_ITEM, P_STATE BOOLEAN);
  
  -- FUNCTION INSERT_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN BOOLEAN;
  -- FUNCTION GET_INSERT_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN BOOLEAN;
  
  -- PROCEDURE SET_INSERT_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_STATE BOOLEAN);


  /**
   * Returns the canvas to which the item is assigned.
   */
  FUNCTION CANVAS(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_CANVAS;
  FUNCTION GET_CANVAS(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_CANVAS;


  /**
   * Returns the VARCHAR2 string TRUE if the current item is valid, and the VARCHAR2 string FALSE if the current item is not valid.
   */
  -- FUNCTION ITEM_IS_VALID(P_ITEM IN STD_ITEM) RETURN VARCHAR2;
  -- FUNCTION GET_ITEM_IS_VALID(P_ITEM IN STD_ITEM) RETURN VARCHAR2;
  
  -- PROCEDURE SET_ITEM_IS_VALID(P_ITEM IN STD_ITEM, P_IS_VALID IN BOOLEAN);


  /**
   * Returns the name of the item.
   */
  FUNCTION NAME(P_ITEM IN STD_ITEM) RETURN VARCHAR2;
  FUNCTION GET_NAME(P_ITEM IN STD_ITEM) RETURN VARCHAR2;


  /**
   * Returns the name of the tab page to which the item is assigned. Note that the item must be assigned to a tab canvas in order for Form Builder to return the name of the item’s tab page.
   */
  FUNCTION TAB_PAGE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_TAB_PAGE;
  FUNCTION GET_TAB_PAGE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_TAB_PAGE;


  -- /**
  --  * Returns the type of the item. Returns BUTTON if the item is a button, CHART ITEM if the item is a chart item, CHECKBOX if the item is a check box, DISPLAY ITEM if the item is a display item, IMAGE if the item is an image item, LIST if the item is a list item, OLE OBJECT if the item is an OCX control or an OLE container, RADIO GROUP if the item is a radio group, TEXT ITEM if the item is a text item, USER AREA if the item is a user area, and VBX CONTROL if the item is a custom item that is a VBX control.
  --  */
  -- FUNCTION ITEM_TYPE RETURN VARCHAR2;
  -- FUNCTION GET_ITEM_TYPE RETURN VARCHAR2;
  
  -- PROCEDURE SET_ITEM_TYPE;


  -- /**
  --  * Returns the text alignment for text items and display items only. Valid return values are START, END, LEFT, CENTER, RIGHT.
  --  */
  -- FUNCTION JUSTIFICATION RETURN VARCHAR2;
  -- FUNCTION GET_JUSTIFICATION RETURN VARCHAR2;
  
  -- PROCEDURE SET_JUSTIFICATION;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the cursor is to re-enter at the identical location it was in when it left the item, and the VARCHAR2 string FALSE if the cursor is to re-enter the item at its default position.
  --  */
  -- FUNCTION KEEP_POSITION RETURN VARCHAR2;
  -- FUNCTION GET_KEEP_POSITION RETURN VARCHAR2;
  
  -- PROCEDURE SET_KEEP_POSITION;


  -- /**
  --  * Returns the VARCHAR2 value defined for the item’s Label property. This property is valid only for items that have labels, such as buttons and check boxes.
  --  */
  -- FUNCTION LABEL RETURN VARCHAR2;
  -- FUNCTION GET_LABEL RETURN VARCHAR2;
  
  -- PROCEDURE SET_LABEL;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the item is a text item to which a list of values (LOV) is attached; otherwise returns the VARCHAR2 string FALSE.
  --  */
  -- FUNCTION LIST RETURN VARCHAR2;
  -- FUNCTION GET_LIST RETURN VARCHAR2;
  
  -- PROCEDURE SET_LIST;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if Form Builder should attempt to lock a row based on a potential change to this item, and returns the VARCHAR2 string FALSE if no lock should be attempted.
  --  */
  -- FUNCTION LOCK_RECORD_ON_CHANGE RETURN VARCHAR2;
  -- FUNCTION GET_LOCK_RECORD_ON_CHANGE RETURN VARCHAR2;
  
  -- PROCEDURE SET_LOCK_RECORD_ON_CHANGE;


  -- /**
  --  * Returns the VARCHAR2 name of the LOV associated with the given item. If the LOV name does not exist, you will get an error message.
  --  */
  -- FUNCTION LOV_NAME RETURN VARCHAR2;
  -- FUNCTION GET_LOV_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_LOV_NAME;


  -- /**
  --  * Returns the x coordinate of the LOV associated with the text item. (Corresponds to the List X Position property.)
  --  */
  -- FUNCTION LOV_X_POS RETURN VARCHAR2;
  -- FUNCTION GET_LOV_X_POS RETURN VARCHAR2;
  
  -- PROCEDURE SET_LOV_X_POS;


  -- /**
  --  * Returns the y coordinate of the LOV associated with the text item. (Corresponds to the List Y Position property.)
  --  */
  -- FUNCTION LOV_Y_POS RETURN VARCHAR2;
  -- FUNCTION GET_LOV_Y_POS RETURN VARCHAR2;
  
  -- PROCEDURE SET_LOV_Y_POS;


  -- /**
  --  * Returns the maximum length setting for the item. The value is returned as a whole NUMBER.
  --  */
  -- FUNCTION MAX_LENGTH RETURN VARCHAR2;
  -- FUNCTION GET_MAX_LENGTH RETURN VARCHAR2;
  
  -- PROCEDURE SET_MAX_LENGTH;


  -- /**
  --  * Merges the contents of the specified visual attribute with the current row’s visual attribute (rather than replacing it).
  --  */
  -- FUNCTION MERGE_CURRENT_ROW_VA RETURN VARCHAR2;
  -- FUNCTION GET_MERGE_CURRENT_ROW_VA RETURN VARCHAR2;
  
  -- PROCEDURE SET_MERGE_CURRENT_ROW_VA;


  -- /**
  --  * Merges the contents of the specified visual attribute with the tooltip’s current visual attribute (rather than replacing it).
  --  */
  -- FUNCTION MERGE_TOOLTIP_ATTRIBUTE RETURN VARCHAR2;
  -- FUNCTION GET_MERGE_TOOLTIP_ATTRIBUTE RETURN VARCHAR2;
  
  -- PROCEDURE SET_MERGE_TOOLTIP_ATTRIBUTE;


  -- /**
  --  * Merges the contents of the specified visual attribute with the object’s current visual attribute (rather than replacing it).
  --  */
  -- FUNCTION MERGE_VISUAL_ATTRIBUTE RETURN VARCHAR2;
  -- FUNCTION GET_MERGE_VISUAL_ATTRIBUTE RETURN VARCHAR2;
  
  -- PROCEDURE SET_MERGE_VISUAL_ATTRIBUTE;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if Mouse Navigate is set to Yes for the item, and the VARCHAR2 string FALSE if it is set to No for the item.
  --  */
  -- FUNCTION MOUSE_NAVIGATE RETURN VARCHAR2;
  -- FUNCTION GET_MOUSE_NAVIGATE RETURN VARCHAR2;
  
  -- PROCEDURE SET_MOUSE_NAVIGATE;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the item is a multi-line text item, and the VARCHAR2 string FALSE if it is a single-line text item.
  --  */
  -- FUNCTION MULTI_LINE RETURN VARCHAR2;
  -- FUNCTION GET_MULTI_LINE RETURN VARCHAR2;
  
  -- PROCEDURE SET_MULTI_LINE;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the NAVIGABLE property is set to true at the item level. Returns the string FALSE if the property is set to false.
  --  */
  -- FUNCTION NAVIGABLE(STD RETURN VARCHAR2;
  -- FUNCTION GET_NAVIGABLE(STD RETURN VARCHAR2;
  
  -- PROCEDURE SET_NAVIGABLE(STD;


  -- /**
  --  * Returns the name of the next item in the default navigation sequence, as defined by the order of items in the Object Navigator.
  --  */
  -- FUNCTION NEXTITEM RETURN VARCHAR2;
  -- FUNCTION GET_NEXTITEM RETURN VARCHAR2;
  
  -- PROCEDURE SET_NEXTITEM;


  -- /**
  --  * Returns the name of the item that is defined as the "next navigation item" with respect to this current item.
  --  */
  -- FUNCTION NEXT_NAVIGATION_ITEM RETURN VARCHAR2;
  -- FUNCTION GET_NEXT_NAVIGATION_ITEM RETURN VARCHAR2;
  
  -- PROCEDURE SET_NEXT_NAVIGATION_ITEM;


  -- /**
  --  * Returns the setting for any of the OLE popup menu item properties: POPUPMENU_COPY_ITEM, POPUPMENU_CUT_ITEM, POPUPMENU_DELOBJ_ITEM, POPUPMENU_INSOBJ_ITEM, POPUPMENU_LINKS_ITEM, POPUPMENU_OBJECT_ITEM, POPUPMENU_PASTE_ITEM.
  --  */
  -- FUNCTION POPUPMENU_CONTENT_ITEM RETURN VARCHAR2;
  -- FUNCTION GET_POPUPMENU_CONTENT_ITEM RETURN VARCHAR2;
  
  -- PROCEDURE SET_POPUPMENU_CONTENT_ITEM;


  -- /**
  --  * Returns the VARCHAR2 string HIDDEN if the OLE popup menu item is not displayed. Returns the VARCHAR2 string ENABLED if the OLE popup menu item is displayed and enabled. Returns the VARCHAR2 string DISABLED if the OLE popup menu item is displayed and not enabled. Returns the VARCHAR2 string UNSUPPORTED if the platform is not Microsoft Windows.
  --  */
  -- FUNCTION POPUPEMNU_PASTESPEC_ITEM RETURN VARCHAR2;
  -- FUNCTION GET_POPUPEMNU_PASTESPEC_ITEM RETURN VARCHAR2;
  
  -- PROCEDURE SET_POPUPEMNU_PASTESPEC_ITEM;


  -- /**
  --  * Returns the name of the previous item.
  --  */
  -- FUNCTION PREVIOUSITEM RETURN VARCHAR2;
  -- FUNCTION GET_PREVIOUSITEM RETURN VARCHAR2;
  
  -- PROCEDURE SET_PREVIOUSITEM;


  -- /**
  --  * Returns the name of the item that is defined as the "previous navigation item" with respect to this current item.
  --  */
  -- FUNCTION PREVIOUS_NAVIGATION_ITEM RETURN VARCHAR2;
  -- FUNCTION GET_PREVIOUS_NAVIGATION_ITEM RETURN VARCHAR2;
  
  -- PROCEDURE SET_PREVIOUS_NAVIGATION_ITEM;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the item is a primary key, and the VARCHAR2 string FALSE if it is not.
  --  */
  -- FUNCTION PRIMARY_KEY RETURN VARCHAR2;
  -- FUNCTION GET_PRIMARY_KEY RETURN VARCHAR2;
  
  -- PROCEDURE SET_PRIMARY_KEY;


  -- /**
  --  * Returns the distance between the item and its prompt as a VARCHAR2 value.
  --  */
  -- FUNCTION PROMPT_ALIGNMENT_OFFSET RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_ALIGNMENT_OFFSET RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_ALIGNMENT_OFFSET;


  -- /**
  --  * The color of the object’s background region.
  --  */
  -- FUNCTION PROMPT_BACKGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_BACKGROUND_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_BACKGROUND_COLOR;


  -- /**
  --  * Returns the prompt’s display style, either FIRST_RECORD, HIDDEN, or ALL_RECORDS.
  --  */
  -- FUNCTION PROMPT_DISPLAY_STYLE RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_DISPLAY_STYLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_DISPLAY_STYLE;


  -- /**
  --  * Returns a value that indicates which edge the item’s prompt is attached to, either START, END, TOP, or BOTTOM.
  --  */
  -- FUNCTION PROMPT_EDGE RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_EDGE RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_EDGE;


  -- /**
  --  * Returns a value that indicates which edge the item’s prompt is aligned to, either START, END, or CENTER.
  --  */
  -- FUNCTION PROMPT_EDGE_ALIGNMENT RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_EDGE_ALIGNMENT RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_EDGE_ALIGNMENT;


  -- /**
  --  * Returns the distance between the item and its prompt as a VARCHAR2 value.
  --  */
  -- FUNCTION PROMPT_EDGE_OFFSET RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_EDGE_OFFSET RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_EDGE_OFFSET;


  -- /**
  --  * The pattern to be used for the object's fill region. Patterns are rendered in the two colors specified by Background Color and Foreground Color.
  --  */
  -- FUNCTION PROMPT_FILL_PATTERN RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_FILL_PATTERN RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_FILL_PATTERN;


  -- /**
  --  * The font family, or typeface, that should be used for text in the object. The list of fonts available is system-dependent.
  --  */
  -- FUNCTION PROMPT_FONT_NAME RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_FONT_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_FONT_NAME;


  -- /**
  --  * The size of the font, specified in points.
  --  */
  -- FUNCTION PROMPT_FONT_SIZE RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_FONT_SIZE RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_FONT_SIZE;


  -- /**
  --  * The width of the font, that is, the amount of space between characters (kerning).
  --  */
  -- FUNCTION PROMPT_FONT_SPACING RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_FONT_SPACING RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_FONT_SPACING;


  -- /**
  --  * The style of the font.
  --  */
  -- FUNCTION PROMPT_FONT_STYLE RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_FONT_STYLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_FONT_STYLE;


  -- /**
  --  * The weight of the font.
  --  */
  -- FUNCTION PROMPT_FONT_WEIGHT RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_FONT_WEIGHT RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_FONT_WEIGHT;


  -- /**
  --  * The color of the object's foreground region. For items, the Foreground Color attribute defines the color of text displayed in the item.
  --  */
  -- FUNCTION PROMPT_FOREGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_FOREGROUND_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_FOREGROUND_COLOR;


  -- /**
  --  * Returns the text label that displays for an item.
  --  */
  -- FUNCTION PROMPT_TEXT RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_TEXT RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_TEXT;


  -- /**
  --  * Returns a value that indicates how the prompt is justified, either START, LEFT, RIGHT, CENTER, or END.
  --  */
  -- FUNCTION PROMPT_TEXT_ALIGNMENT RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_TEXT_ALIGNMENT RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_TEXT_ALIGNMENT;


  -- /**
  --  * Returns a value that indicates the prompt’s named visual attribute .
  --  */
  -- FUNCTION PROMPT_VISUAL_ATTRIBUTE RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_VISUAL_ATTRIBUTE RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_VISUAL_ATTRIBUTE;


  -- /**
  --  * Specifies that the object is to appear on a monochrome bitmap display device as white text on a black background.
  --  */
  -- FUNCTION PROMPT_WHITE_ON_BLACK RETURN VARCHAR2;
  -- FUNCTION GET_PROMPT_WHITE_ON_BLACK RETURN VARCHAR2;
  
  -- PROCEDURE SET_PROMPT_WHITE_ON_BLACK;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the item can be included in a query, and the VARCHAR2 string FALSE if it cannot.
  --  */
  -- FUNCTION QUERYABLE RETURN VARCHAR2;
  -- FUNCTION GET_QUERYABLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_QUERYABLE;


  -- /**
  --  * Returns the number of characters an operator is allowed to enter in the text item when the form is in Enter Query mode.
  --  */
  -- FUNCTION QUERY_LENGTH RETURN VARCHAR2;
  -- FUNCTION GET_QUERY_LENGTH RETURN VARCHAR2;
  
  -- PROCEDURE SET_QUERY_LENGTH;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if property is set to Yes for the item, and the VARCHAR2 string FALSE if the property is set to No for the item.
  --  */
  -- FUNCTION QUERY_ONLY RETURN VARCHAR2;
  -- FUNCTION GET_QUERY_ONLY RETURN VARCHAR2;
  
  -- PROCEDURE SET_QUERY_ONLY;


  -- /**
  --  * Returns the high value of the range limit. (Corresponds to the Range property.)
  --  */
  -- FUNCTION RANGE_HIGH RETURN VARCHAR2;
  -- FUNCTION GET_RANGE_HIGH RETURN VARCHAR2;
  
  -- PROCEDURE SET_RANGE_HIGH;


  -- /**
  --  * Returns the low value of the range limit. (Corresponds to the Range property.)
  --  */
  -- FUNCTION RANGE_LOW RETURN VARCHAR2;
  -- FUNCTION GET_RANGE_LOW RETURN VARCHAR2;
  
  -- PROCEDURE SET_RANGE_LOW;


  /**
   * For multi-line text items, returns the VARCHAR2 string TRUE if the REQUIRED property is set to true at the item level. Returns the string FALSE if the property is set to false.
   */
  -- FUNCTION REQUIRED RETURN VARCHAR2;
  -- FUNCTION GET_REQUIRED RETURN VARCHAR2;
  
  -- PROCEDURE SET_REQUIRED;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the Show Scroll Bar property is Yes, and the VARCHAR2 string FALSE if the Show Scroll Bar property is No.
  --  */
  -- FUNCTION SCROLLBAR RETURN VARCHAR2;
  -- FUNCTION GET_SCROLLBAR RETURN VARCHAR2;
  
  -- PROCEDURE SET_SCROLLBAR;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if is displayed on the specified sound item, FALSE if not.
  --  */
  -- FUNCTION SHOW_FAST_FORWARD_BUTTON RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_FAST_FORWARD_BUTTON RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_FAST_FORWARD_BUTTON;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the imagemanipulation palette is displayed adjacent to the specified image item, FALSE if not.
  --  */
  -- FUNCTION SHOW_PALETTE RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_PALETTE RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_PALETTE;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if is displayed on the specified sound item, FALSE if not.
  --  */
  -- FUNCTION SHOW_PLAY_BUTTON RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_PLAY_BUTTON RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_PLAY_BUTTON;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if is displayed on the specified sound item, FALSE if not.
  --  */
  -- FUNCTION SHOW_RECORD_BUTTON RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_RECORD_BUTTON RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_RECORD_BUTTON;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if is displayed on the specified sound item, FALSE if not.
  --  */
  -- FUNCTION SHOW_REWIND_BUTTON RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_REWIND_BUTTON RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_REWIND_BUTTON;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the Slider position control is displayed on the specified sound item, FALSE if not.
  --  */
  -- FUNCTION SHOW_SLIDER RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_SLIDER RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_SLIDER;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if is displayed on the specified sound item, FALSE if not.
  --  */
  -- FUNCTION SHOW_TIME_INDICATOR RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_TIME_INDICATOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_TIME_INDICATOR;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if is displayed on the specified sound item, FALSE if not.
  --  */
  -- FUNCTION SHOW_VOLUME_CONTROL RETURN VARCHAR2;
  -- FUNCTION GET_SHOW_VOLUME_CONTROL RETURN VARCHAR2;
  
  -- PROCEDURE SET_SHOW_VOLUME_CONTROL;


  -- /**
  --  * The color of the object’s background region.
  --  */
  -- FUNCTION TOOLTIP_BACKGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_BACKGROUND_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_BACKGROUND_COLOR;


  -- /**
  --  * The pattern to be used for the object’s fill region. Patterns are rendered in the two colors specified by Background Color and Foreground Color.
  --  */
  -- FUNCTION TOOLTIP_FILL_PATTERN RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_FILL_PATTERN RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_FILL_PATTERN;


  -- /**
  --  * The font family, or typeface, that should be used for text in the object. The list of fonts available is system-dependent.
  --  */
  -- FUNCTION TOOLTIP_FONT_NAME RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_FONT_NAME RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_FONT_NAME;


  -- /**
  --  * The size of the font, specified in points.
  --  */
  -- FUNCTION TOOLTIP_FONT_SIZE RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_FONT_SIZE RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_FONT_SIZE;


  -- /**
  --  * The width of the font, that is, the amount of space between characters (kerning).
  --  */
  -- FUNCTION TOOLTIP_FONT_SPACING RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_FONT_SPACING RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_FONT_SPACING;


  -- /**
  --  * The style of the font.
  --  */
  -- FUNCTION TOOLTIP_FONT_STYLE RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_FONT_STYLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_FONT_STYLE;


  -- /**
  --  * The weight of the font.
  --  */
  -- FUNCTION TOOLTIP_FONT_WEIGHT RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_FONT_WEIGHT RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_FONT_WEIGHT;


  -- /**
  --  * The color of the object’s foreground region. For items, the Foreground Color attribute defines the color of text displayed in the item.
  --  */
  -- FUNCTION TOOLTIP_FOREGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_FOREGROUND_COLOR RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_FOREGROUND_COLOR;


  -- /**
  --  * Specifies that the object is to appear on a monochrome bitmap display device as white text on a black background.
  --  */
  -- FUNCTION TOOLTIP_WHITE_ON_BLACK RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_WHITE_ON_BLACK RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_WHITE_ON_BLACK;


  -- /**
  --  * Returns the item’s tooltip text.
  --  */
  -- FUNCTION TOOLTIP_TEXT RETURN VARCHAR2;
  -- FUNCTION GET_TOOLTIP_TEXT RETURN VARCHAR2;
  
  -- PROCEDURE SET_TOOLTIP_TEXT;


  /**
   * Returns the VARCHAR2 BOOLEAN TRUE if the UPDATE_ALLOWED property is set 
   * to true at the item level. Returns the BOOLEAN FALSE if the property is 
   * set to false.
   */
  FUNCTION UPDATE_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN;
  FUNCTION GET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN;
  
  PROCEDURE SET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_STATE BOOLEAN);
  
  FUNCTION UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN BOOLEAN;
  FUNCTION GET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN BOOLEAN;

  PROCEDURE SET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_STATE BOOLEAN);


  -- /**
  --  * Returns the VARCHAR2 string TRUE if Form Builder should treat the item as updated, and FALSE if it should not.
  --  */
  -- FUNCTION UPDATE_COLUMN RETURN VARCHAR2;
  -- FUNCTION GET_UPDATE_COLUMN RETURN VARCHAR2;
  
  -- PROCEDURE SET_UPDATE_COLUMN;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the item should be updated only if it is NULL, and the VARCHAR2 string FALSE if it can always be updated. (Corresponds to the Update if NULL property.)
  --  */
  -- FUNCTION UPDATE_NULL RETURN VARCHAR2;
  -- FUNCTION GET_UPDATE_NULL RETURN VARCHAR2;
  
  -- PROCEDURE SET_UPDATE_NULL;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if the UPDATE_PERMISSION property is set to ON, turning on the item's UPDATEABLE and UPDATE_NULL properties. The VARCHAR2 string FALSE indicates that UPDATEABLE and UPDATE_NULL are turned off.
  --  */
  -- FUNCTION UPDATE_PERMISSION RETURN VARCHAR2;
  -- FUNCTION GET_UPDATE_PERMISSION RETURN VARCHAR2;
  
  -- PROCEDURE SET_UPDATE_PERMISSION;


  -- /**
  --  * Returns the VARCHAR2 string TRUE if Form Builder should validate the value of the text item against the values in the attached LOV; otherwise returns the VARCHAR2 string FALSE.
  --  */
  -- FUNCTION VALIDATE_FROM_LIST RETURN VARCHAR2;
  -- FUNCTION GET_VALIDATE_FROM_LIST RETURN VARCHAR2;
  
  -- PROCEDURE SET_VALIDATE_FROM_LIST;


  /**
   * Returns the VARCHAR2 string TRUE if the property is set to Yes for the item, and the VARCHAR2 string FALSE if the property is set to No for the item.
   */
  -- FUNCTION VISIBLE RETURN VARCHAR2;
  -- FUNCTION GET_VISIBLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_VISIBLE;


  /**
   * Returns the name of the visual attribute currently in force. If no named
   * visual attribute is assigned to the item, returns DEFAULT for a default 
   * visual attribute.
   */
  FUNCTION VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_VATTR;
  FUNCTION GET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_VATTR;
  
  PROCEDURE SET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_VISUAL_ATTRIBUTE IN STD_STRUCTURE.STD_VATTR);

  FUNCTION VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN STD_STRUCTURE.STD_VATTR;
  FUNCTION GET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN STD_STRUCTURE.STD_VATTR;
  
  PROCEDURE SET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_VISUAL_ATTRIBUTE IN STD_STRUCTURE.STD_VATTR);


  -- /**
  --  * Specifies that the object is to appear on a monochrome bitmap display device as white text on a black background.
  --  */
  -- FUNCTION WHITE_ON_BLACK RETURN VARCHAR2;
  -- FUNCTION GET_WHITE_ON_BLACK RETURN VARCHAR2;
  
  -- PROCEDURE SET_WHITE_ON_BLACK;


  /**
   * Returns the width of the item.
   */
  FUNCTION WIDTH(P_ITEM IN STD_ITEM) RETURN NUMBER;
  FUNCTION GET_WIDTH(P_ITEM IN STD_ITEM) RETURN NUMBER;
  
  PROCEDURE SET_WIDTH(P_ITEM IN STD_ITEM, P_WIDTH IN NUMBER);


  -- /**
  --  * Returns the a unique internal VARCHAR2 constant that is used to refer to objects. Returns the VARCHAR2 value ‘0’ if the platform is not Microsoft Windows.
  --  */
  -- FUNCTION WINDOW_HANDLE RETURN VARCHAR2;
  -- FUNCTION GET_WINDOW_HANDLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_WINDOW_HANDLE;


  -- /**
  --  * Returns VARCHAR2 if the item has wrap style set to VARCHAR2, WORD if word wrap is set, NONE if no wrap style is specified for the item.
  --  */
  -- FUNCTION WRAP_STYLE RETURN VARCHAR2;
  -- FUNCTION GET_WRAP_STYLE RETURN VARCHAR2;
  
  -- PROCEDURE SET_WRAP_STYLE;


  /**
   * Returns the x coordinate that reflects the current placement of the item’s upper left corner relative to the upper left corner of the canvas.
   */
  FUNCTION X_POS(P_ITEM IN STD_ITEM) RETURN NUMBER;
  FUNCTION GET_X_POS(P_ITEM IN STD_ITEM) RETURN NUMBER;
  
  PROCEDURE SET_X_POS(P_ITEM IN STD_ITEM, P_X_POS IN NUMBER);


  /**
   * Returns the y coordinate that reflects the current placement of the item’s upper left corner relative to the upper left corner of the canvas.
   */
  FUNCTION Y_POS(P_ITEM IN STD_ITEM) RETURN NUMBER;
  FUNCTION GET_Y_POS(P_ITEM IN STD_ITEM) RETURN NUMBER;
  
  PROCEDURE SET_Y_POS(P_ITEM IN STD_ITEM, P_Y_POS IN NUMBER);

  /**
   * Sets the value of a user-defined property in a Java pluggable component
   */
  FUNCTION CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER DEFAULT 1) RETURN VARCHAR2;
  FUNCTION GET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER DEFAULT 1) RETURN VARCHAR2;
  FUNCTION GET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER DEFAULT 1) RETURN VARCHAR2;
  
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN VARCHAR2);
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN OUT NOCOPY CLOB);
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_NUMBER_VALUE IN NUMBER);
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_BOOLEAN_VALUE IN BOOLEAN);
  
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN VARCHAR2);
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN OUT NOCOPY CLOB);
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_NUMBER_VALUE IN NUMBER);
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_BOOLEAN_VALUE IN BOOLEAN);

  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN VARCHAR2);
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN OUT NOCOPY CLOB);
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_NUMBER_VALUE IN NUMBER);
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_BOOLEAN_VALUE IN BOOLEAN);
  
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN VARCHAR2);
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN OUT NOCOPY CLOB);
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_NUMBER_VALUE IN NUMBER);
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_BOOLEAN_VALUE IN BOOLEAN);
  
END STD_ITEM;