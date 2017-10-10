CREATE OR REPLACE PACKAGE STD_BLOCK_PROPS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public namespace for Built-in Item Properties
  ------------------------------------------------------------------------------

  ALL_RECORDS                    CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#ALL_RECORDS;
  BLOCKSCROLLBAR_X_POS           CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#BLOCKSCROLLBAR_X_POS;
  BLOCKSCROLLBAR_Y_POS           CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#BLOCKSCROLLBAR_Y_POS;
  COLUMN_SECURITY                CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#COLUMN_SECURITY;
  COORDINATION_STATUS            CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#COORDINATION_STATUS;
  CURRENT_RECORD                 CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_RECORD;
  CURRENT_RECORD_ATTRIBUTE       CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_RECORD_ATTRIBUTE;
  CURRENT_ROW_BG_COLOR           CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_BG_COLOR;
  CURRENT_ROW_BACKGROUND_COLOR   CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_BG_COLOR;
  CURRENT_ROW_FILL_PATTERN       CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FILL_PATTERN;
  CURRENT_ROW_FONT_NAME          CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FONT_NAME;
  CURRENT_ROW_FONT_SIZE          CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FONT_SIZE;
  CURRENT_ROW_FONT_SPACING       CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FONT_SPACING;
  CURRENT_ROW_FONT_STYLE         CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FONT_STYLE;
  CURRENT_ROW_FONT_WEIGHT        CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FONT_WEIGHT;
  CURRENT_ROW_FG_COLOR           CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FG_COLOR;
  CURRENT_ROW_FOREGROUND_COLOR   CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#CURRENT_ROW_FG_COLOR;
  DEFAULT_WHERE                  CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#DEFAULT_WHERE;
  DELETE_ALLOWED                 CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#DELETE_ALLOWED;
  DML_DATA_TARGET_NAME           CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#DML_DATA_TARGET_NAME;
  DML_DATA_TARGET_TYPE           CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#DML_DATA_TARGET_TYPE;
  ENFORCE_PRIMARY_KEY            CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#ENFORCE_PRIMARY_KEY;
  ENTERABLE                      CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#ENTERABLE;
  FIRST_DETAIL_RELATION          CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#FIRST_DETAIL_RELATION;
  FIRST_ITEM                     CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#FIRST_ITEM;
  FIRST_MASTER_RELATION          CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#FIRST_MASTER_RELATION;
  INSERT_ALLOWED                 CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#INSERT_ALLOWED;
  KEY_MODE                       CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#KEY_MODE;
  LAST_ITEM                      CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#LAST_ITEM;
  LAST_QUERY                     CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#LAST_QUERY;
  LOCKING_MODE                   CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#LOCKING_MODE;
  MAX_QUERY_TIME                 CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#MAX_QUERY_TIME;
  MAX_RECORDS_FETCHED            CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#MAX_RECORDS_FETCHED;
  NAVIGATION_STYLE               CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#NAVIGATION_STYLE;
  NEXTBLOCK                      CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#NEXTBLOCK;
  NEXT_NAVIGATION_BLOCK          CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#NEXT_NAVIGATION_BLOCK;
  OPTIMIZER_HINT                 CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#OPTIMIZER_HINT;
  ORDER_BY                       CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#ORDER_BY;
  PREVIOUS_NAVIGATION_BLOCK      CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#PREVIOUS_NAVIGATION_BLOCK;
  QUERY_ALLOWED                  CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#QUERY_ALLOWED;
  QUERY_DATA_SOURCE_NAME         CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#QUERY_DATA_SOURCE_NAME;
  QUERY_DATA_SOURCE_TYPE         CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#QUERY_DATA_SOURCE_TYPE;
  QUERY_HITS                     CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#QUERY_HITS;
  QUERY_OPTIONS                  CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#QUERY_OPTIONS;
  RECORDS_DISPLAYED              CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#RECORDS_DISPLAYED;
  RECORDS_TO_FETCH               CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#RECORDS_TO_FETCH;
  STATUS                         CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#STATUS;
  TOP_RECORD                     CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#TOP_RECORD;
  UPDATE_ALLOWED                 CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#UPDATE_ALLOWED;
  UPDATE_CHANGED_COLUMNS         CONSTANT NUMBER := STD_BLOCK_PROPS_PRIVATE.BP#UPDATE_CHANGED_COLUMNS;

END STD_BLOCK_PROPS;