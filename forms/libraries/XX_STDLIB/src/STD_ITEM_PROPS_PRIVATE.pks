CREATE OR REPLACE PACKAGE STD_ITEM_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Item Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  IP#AUTO_HINT                   CONSTANT NUMBER := XFRM.AUTO_HINT;
  IP#AUTO_SKIP                   CONSTANT NUMBER := XFRM.AUTO_SKIP;
  IP#BACKGROUND_COLOR            CONSTANT NUMBER := XFRM.BACKGROUND_COLOR;
  IP#BLOCK_NAME                  CONSTANT NUMBER := XFRM.BLOCK_NAME;
  IP#BORDER_BEVEL                CONSTANT NUMBER := XFRM.BORDER_BEVEL;
  IP#CASE_INSENSITIVE_QUERY      CONSTANT NUMBER := XFRM.CASE_INSENSITIVE_QUERY;
  IP#CASE_RESTRICTION            CONSTANT NUMBER := XFRM.CASE_RESTRICTION;
  IP#COLUMN_NAME                 CONSTANT NUMBER := XFRM.COLUMN_NAME;
  -- IP#COMPRESS                    CONSTANT NUMBER := XFRM.COMPRESS; -- Unable to compile, reserved symbol name
  IP#CONCEAL_DATA                CONSTANT NUMBER := XFRM.CONCEAL_DATA;
  IP#CURRENT_RECORD_ATTRIBUTE    CONSTANT NUMBER := XFRM.CURRENT_RECORD_ATTRIBUTE;
  IP#CURRENT_ROW_BG_COLOR        CONSTANT NUMBER := XFRM.CURRENT_ROW_BACKGROUND_COLOR;
  IP#CURRENT_ROW_FILL_PATTERN    CONSTANT NUMBER := XFRM.CURRENT_ROW_FILL_PATTERN;
  IP#CURRENT_ROW_FONT_NAME       CONSTANT NUMBER := XFRM.CURRENT_ROW_FONT_NAME;
  IP#CURRENT_ROW_FONT_SIZE       CONSTANT NUMBER := XFRM.CURRENT_ROW_FONT_SIZE;
  IP#CURRENT_ROW_FONT_SPACING    CONSTANT NUMBER := XFRM.CURRENT_ROW_FONT_SPACING;
  IP#CURRENT_ROW_FONT_STYLE      CONSTANT NUMBER := XFRM.CURRENT_ROW_FONT_STYLE;
  IP#CURRENT_ROW_FONT_WEIGHT     CONSTANT NUMBER := XFRM.CURRENT_ROW_FONT_WEIGHT;
  IP#CURRENT_ROW_FG_COLOR        CONSTANT NUMBER := XFRM.CURRENT_ROW_FOREGROUND_COLOR;
  -- IP#CURRENT_ROW_WHITE_ON_BLACK  CONSTANT NUMBER := XFRM.CURRENT_ROW_WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  IP#DATABASE_VALUE              CONSTANT NUMBER := XFRM.DATABASE_VALUE;
  IP#DATATYPE                    CONSTANT NUMBER := XFRM.DATATYPE;
  IP#DIRECTION                   CONSTANT NUMBER := XFRM.DIRECTION;
  IP#DISPLAYED                   CONSTANT NUMBER := XFRM.DISPLAYED;
  IP#ECHO                        CONSTANT NUMBER := XFRM.ECHO;
  IP#EDITOR_NAME                 CONSTANT NUMBER := XFRM.EDITOR_NAME;
  IP#EDITOR_X_POS                CONSTANT NUMBER := XFRM.EDITOR_X_POS;
  IP#EDITOR_Y_POS                CONSTANT NUMBER := XFRM.EDITOR_Y_POS;
  IP#ENFORCE_KEY                 CONSTANT NUMBER := XFRM.ENFORCE_KEY;
  IP#ENABLED                     CONSTANT NUMBER := XFRM.ENABLED;
  IP#FILL_PATTERN                CONSTANT NUMBER := XFRM.FILL_PATTERN;
  -- IP#FIXED_LENGTH                CONSTANT NUMBER := XFRM.FIXED_LENGTH; -- Not available in Oracle Forms >= 10g
  IP#FONT_NAME                   CONSTANT NUMBER := XFRM.FONT_NAME;
  IP#FONT_SIZE                   CONSTANT NUMBER := XFRM.FONT_SIZE;
  IP#FONT_SPACING                CONSTANT NUMBER := XFRM.FONT_SPACING;
  IP#FONT_STYLE                  CONSTANT NUMBER := XFRM.FONT_STYLE;
  IP#FONT_WEIGHT                 CONSTANT NUMBER := XFRM.FONT_WEIGHT;
  IP#FOREGROUND_COLOR            CONSTANT NUMBER := XFRM.FOREGROUND_COLOR;
  IP#FORMAT_MASK                 CONSTANT NUMBER := XFRM.FORMAT_MASK;
  IP#HEIGHT                      CONSTANT NUMBER := XFRM.HEIGHT;
  IP#HINT_TEXT                   CONSTANT NUMBER := XFRM.HINT_TEXT;
  IP#ICON_NAME                   CONSTANT NUMBER := XFRM.ICON_NAME;
  IP#ICONIC_BUTTON               CONSTANT NUMBER := XFRM.ICONIC_BUTTON;
  -- IP#IMAGE_DEPTH                 CONSTANT NUMBER := XFRM.IMAGE_DEPTH; -- Not available in Oracle Forms >= 10g
  -- IP#IMAGE_FORMAT                CONSTANT NUMBER := XFRM.IMAGE_FORMAT; -- Not available in Oracle Forms >= 10g
  IP#INSERT_ALLOWED              CONSTANT NUMBER := XFRM.INSERT_ALLOWED;
  IP#ITEM_CANVAS                 CONSTANT NUMBER := XFRM.ITEM_CANVAS;
  IP#ITEM_IS_VALID               CONSTANT NUMBER := XFRM.ITEM_IS_VALID;
  IP#ITEM_NAME                   CONSTANT NUMBER := XFRM.ITEM_NAME;
  IP#ITEM_TAB_PAGE               CONSTANT NUMBER := XFRM.ITEM_TAB_PAGE;
  IP#ITEM_TYPE                   CONSTANT NUMBER := XFRM.ITEM_TYPE;
  -- IP#JUSTIFICATION               CONSTANT NUMBER := XFRM.JUSTIFICATION; -- Not available in Oracle Forms >= 10g
  IP#KEEP_POSITION               CONSTANT NUMBER := XFRM.KEEP_POSITION;
  IP#LABEL                       CONSTANT NUMBER := XFRM.LABEL;
  IP#LIST                        CONSTANT NUMBER := XFRM.LIST;
  IP#LOCK_RECORD_ON_CHANGE       CONSTANT NUMBER := XFRM.LOCK_RECORD_ON_CHANGE;
  IP#LOV_NAME                    CONSTANT NUMBER := XFRM.LOV_NAME;
  IP#LOV_X_POS                   CONSTANT NUMBER := XFRM.LOV_X_POS;
  IP#LOV_Y_POS                   CONSTANT NUMBER := XFRM.LOV_Y_POS;
  IP#MAX_LENGTH                  CONSTANT NUMBER := XFRM.MAX_LENGTH;
  -- IP#MERGE_CURRENT_ROW_VA        CONSTANT NUMBER := XFRM.MERGE_CURRENT_ROW_VA; -- Not available in Oracle Forms >= 10g
  IP#MERGE_TOOLTIP_ATTRIBUTE     CONSTANT NUMBER := XFRM.MERGE_TOOLTIP_ATTRIBUTE;
  IP#MERGE_VISUAL_ATTRIBUTE      CONSTANT NUMBER := XFRM.MERGE_VISUAL_ATTRIBUTE;
  IP#MOUSE_NAVIGATE              CONSTANT NUMBER := XFRM.MOUSE_NAVIGATE;
  IP#MULTI_LINE                  CONSTANT NUMBER := XFRM.MULTI_LINE;
  IP#NAVIGABLE                   CONSTANT NUMBER := XFRM.NAVIGABLE;
  IP#NEXTITEM                    CONSTANT NUMBER := XFRM.NEXTITEM;
  IP#NEXT_NAVIGATION_ITEM        CONSTANT NUMBER := XFRM.NEXT_NAVIGATION_ITEM;
  -- IP#POPUPMENU_CONTENT_ITEM      CONSTANT NUMBER := XFRM.POPUPMENU_CONTENT_ITEM; -- Not available in Oracle Forms >= 10g
  -- IP#POPUPEMNU_PASTESPEC_ITEM    CONSTANT NUMBER := XFRM.POPUPEMNU_PASTESPEC_ITEM; -- Not available in Oracle Forms >= 10g
  IP#PREVIOUSITEM                CONSTANT NUMBER := XFRM.PREVIOUSITEM;
  IP#PREVIOUS_NAVIGATION_ITEM    CONSTANT NUMBER := XFRM.PREVIOUS_NAVIGATION_ITEM;
  IP#PRIMARY_KEY                 CONSTANT NUMBER := XFRM.PRIMARY_KEY;
  IP#PROMPT_ALIGNMENT_OFFSET     CONSTANT NUMBER := XFRM.PROMPT_ALIGNMENT_OFFSET;
  IP#PROMPT_BACKGROUND_COLOR     CONSTANT NUMBER := XFRM.PROMPT_BACKGROUND_COLOR;
  IP#PROMPT_DISPLAY_STYLE        CONSTANT NUMBER := XFRM.PROMPT_DISPLAY_STYLE;
  IP#PROMPT_EDGE                 CONSTANT NUMBER := XFRM.PROMPT_EDGE;
  IP#PROMPT_EDGE_ALIGNMENT       CONSTANT NUMBER := XFRM.PROMPT_EDGE_ALIGNMENT;
  IP#PROMPT_EDGE_OFFSET          CONSTANT NUMBER := XFRM.PROMPT_EDGE_OFFSET;
  IP#PROMPT_FILL_PATTERN         CONSTANT NUMBER := XFRM.PROMPT_FILL_PATTERN;
  IP#PROMPT_FONT_NAME            CONSTANT NUMBER := XFRM.PROMPT_FONT_NAME;
  IP#PROMPT_FONT_SIZE            CONSTANT NUMBER := XFRM.PROMPT_FONT_SIZE;
  IP#PROMPT_FONT_SPACING         CONSTANT NUMBER := XFRM.PROMPT_FONT_SPACING;
  IP#PROMPT_FONT_STYLE           CONSTANT NUMBER := XFRM.PROMPT_FONT_STYLE;
  IP#PROMPT_FONT_WEIGHT          CONSTANT NUMBER := XFRM.PROMPT_FONT_WEIGHT;
  IP#PROMPT_FOREGROUND_COLOR     CONSTANT NUMBER := XFRM.PROMPT_FOREGROUND_COLOR;
  IP#PROMPT_TEXT                 CONSTANT NUMBER := XFRM.PROMPT_TEXT;
  IP#PROMPT_TEXT_ALIGNMENT       CONSTANT NUMBER := XFRM.PROMPT_TEXT_ALIGNMENT;
  IP#PROMPT_VISUAL_ATTRIBUTE     CONSTANT NUMBER := XFRM.PROMPT_VISUAL_ATTRIBUTE;
  -- IP#PROMPT_WHITE_ON_BLACK       CONSTANT NUMBER := XFRM.PROMPT_WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  IP#QUERYABLE                   CONSTANT NUMBER := XFRM.QUERYABLE;
  IP#QUERY_LENGTH                CONSTANT NUMBER := XFRM.QUERY_LENGTH;
  IP#QUERY_ONLY                  CONSTANT NUMBER := XFRM.QUERY_ONLY;
  IP#RANGE_HIGH                  CONSTANT NUMBER := XFRM.RANGE_HIGH;
  IP#RANGE_LOW                   CONSTANT NUMBER := XFRM.RANGE_LOW;
  IP#REQUIRED                    CONSTANT NUMBER := XFRM.REQUIRED;
  IP#SCROLLBAR                   CONSTANT NUMBER := XFRM.SCROLLBAR;
  -- IP#SHOW_FAST_FORWARD_BUTTON    CONSTANT NUMBER := XFRM.SHOW_FAST_FORWARD_BUTTON; -- Not available in Oracle Forms >= 10g
  -- IP#SHOW_PALETTE                CONSTANT NUMBER := XFRM.SHOW_PALETTE; -- Not available in Oracle Forms >= 10g
  -- IP#SHOW_PLAY_BUTTON            CONSTANT NUMBER := XFRM.SHOW_PLAY_BUTTON; -- Not available in Oracle Forms >= 10g
  -- IP#SHOW_RECORD_BUTTON          CONSTANT NUMBER := XFRM.SHOW_RECORD_BUTTON; -- Not available in Oracle Forms >= 10g
  -- IP#SHOW_REWIND_BUTTON          CONSTANT NUMBER := XFRM.SHOW_REWIND_BUTTON; -- Not available in Oracle Forms >= 10g
  -- IP#SHOW_SLIDER                 CONSTANT NUMBER := XFRM.SHOW_SLIDER; -- Not available in Oracle Forms >= 10g
  -- IP#SHOW_TIME_INDICATOR         CONSTANT NUMBER := XFRM.SHOW_TIME_INDICATOR; -- Not available in Oracle Forms >= 10g
  -- IP#SHOW_VOLUME_CONTROL         CONSTANT NUMBER := XFRM.SHOW_VOLUME_CONTROL; -- Not available in Oracle Forms >= 10g
  IP#TOOLTIP_BACKGROUND_COLOR    CONSTANT NUMBER := XFRM.TOOLTIP_BACKGROUND_COLOR;
  IP#TOOLTIP_FILL_PATTERN        CONSTANT NUMBER := XFRM.TOOLTIP_FILL_PATTERN;
  IP#TOOLTIP_FONT_NAME           CONSTANT NUMBER := XFRM.TOOLTIP_FONT_NAME;
  IP#TOOLTIP_FONT_SIZE           CONSTANT NUMBER := XFRM.TOOLTIP_FONT_SIZE;
  IP#TOOLTIP_FONT_SPACING        CONSTANT NUMBER := XFRM.TOOLTIP_FONT_SPACING;
  IP#TOOLTIP_FONT_STYLE          CONSTANT NUMBER := XFRM.TOOLTIP_FONT_STYLE;
  IP#TOOLTIP_FONT_WEIGHT         CONSTANT NUMBER := XFRM.TOOLTIP_FONT_WEIGHT;
  IP#TOOLTIP_FOREGROUND_COLOR    CONSTANT NUMBER := XFRM.TOOLTIP_FOREGROUND_COLOR;
  -- IP#TOOLTIP_WHITE_ON_BLACK      CONSTANT NUMBER := XFRM.TOOLTIP_WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  IP#TOOLTIP_TEXT                CONSTANT NUMBER := XFRM.TOOLTIP_TEXT;
  IP#UPDATE_ALLOWED              CONSTANT NUMBER := XFRM.UPDATE_ALLOWED;
  IP#UPDATE_COLUMN               CONSTANT NUMBER := XFRM.UPDATE_COLUMN;
  IP#UPDATE_NULL                 CONSTANT NUMBER := XFRM.UPDATE_NULL;
  IP#UPDATE_PERMISSION           CONSTANT NUMBER := XFRM.UPDATE_PERMISSION;
  IP#VALIDATE_FROM_LIST          CONSTANT NUMBER := XFRM.VALIDATE_FROM_LIST;
  IP#VISIBLE                     CONSTANT NUMBER := XFRM.VISIBLE;
  IP#VISUAL_ATTRIBUTE            CONSTANT NUMBER := XFRM.VISUAL_ATTRIBUTE;
  -- IP#WHITE_ON_BLACK              CONSTANT NUMBER := XFRM.WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  IP#WIDTH                       CONSTANT NUMBER := XFRM.WIDTH;
  IP#WINDOW_HANDLE               CONSTANT NUMBER := XFRM.WINDOW_HANDLE;
  IP#WRAP_STYLE                  CONSTANT NUMBER := XFRM.WRAP_STYLE;
  IP#X_POS                       CONSTANT NUMBER := XFRM.X_POS;
  IP#Y_POS                       CONSTANT NUMBER := XFRM.Y_POS;
  
END STD_ITEM_PROPS_PRIVATE;