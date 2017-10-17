CREATE OR REPLACE PACKAGE STD_BLOCK IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_BLOCK IS STD_STRUCTURE.STD_BLOCK;

	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_BLOCK_NAME IN STD_TYPE.BLOCK_NAME) RETURN STD_BLOCK;

  FUNCTION IS_NULL(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN;

  FUNCTION EQUALS(P_BLOCK_1 IN STD_BLOCK, P_BLOCK_2 IN STD_BLOCK) RETURN BOOLEAN;

  PROCEDURE FOCUS(P_BLOCK IN STD_BLOCK);

  PROCEDURE GO(P_BLOCK IN STD_BLOCK);
  

  /**
   * Returns the BOOLEAN TRUE if the INSERT_ALLOWED property is set to true at the block level. Returns the BOOLEAN FALSE if the property is set to false.
   */
  FUNCTION INSERT_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN;
  FUNCTION GET_INSERT_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN;
  
  PROCEDURE SET_INSERT_ALLOWED(P_BLOCK IN STD_BLOCK, P_STATE BOOLEAN);


  /**
   * Returns the VARCHAR2 BOOLEAN TRUE if the UPDATE_ALLOWED property is set to true at the block level. Returns the BOOLEAN FALSE if the property is set to false.
   */
  FUNCTION UPDATE_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN;
  FUNCTION GET_UPDATE_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN;
  
  PROCEDURE SET_UPDATE_ALLOWED(P_BLOCK IN STD_BLOCK, P_STATE BOOLEAN);

  -- /**
  --  * Specifies whether all the records matching the query criteria should be fetched into the data block when a query is executed.
  --  */
  -- FUNCTION ALL_RECORDS RETURN VARCHAR2;
  -- FUNCTION GET_ALL_RECORDS RETURN VARCHAR2;

  -- PROCEDURE SET_ALL_RECORDS;


  -- /**
  --  * Returns the x position of the block’s scroll bar as a number specified in the form coordinate units indicated by the Coordinate System form property.
  --  */
  -- FUNCTION BLOCKSCROLLBAR_X_POS RETURN VARCHAR2;
  -- FUNCTION GET_BLOCKSCROLLBAR_X_POS RETURN VARCHAR2;

  -- PROCEDURE SET_BLOCKSCROLLBAR_X_POS;


  -- /**
  --  * Returns the y position of the block’s scroll bar as a number specified in the form coordinate units indicated by the Coordinate System form property.
  --  */
  -- FUNCTION BLOCKSCROLLBAR_Y_POS RETURN VARCHAR2;
  -- FUNCTION GET_BLOCKSCROLLBAR_Y_POS RETURN VARCHAR2;

  -- PROCEDURE SET_BLOCKSCROLLBAR_Y_POS;


  -- /**
  --  * Returns the VARCHAR2 value of TRUE if column security is set to Yes, and the VARCHAR2 string FALSE if it is set to No.
  --  */
  -- FUNCTION COLUMN_SECURITY RETURN VARCHAR2;
  -- FUNCTION GET_COLUMN_SECURITY RETURN VARCHAR2;

  -- PROCEDURE SET_COLUMN_SECURITY;


  -- /**
  --  * For a block that is a detail block in a master-detail block relation, this property specifies the coordination status of the block with respect to its master block(s). Returns the VARCHAR2 value COORDINATED if the block is coordinated with all of its master blocks. If it is not coordinated with all of its master blocks, the built-in returns the VARCHAR2 value NON_COORDINATED. Immediately after records are fetched to the detail block, the status of the detail block is COORDINATED. When a different record becomes the current record in the master block, the status of the detail block again becomes NON_COORDINATED.
  --  */
  -- FUNCTION COORDINATION_STATUS RETURN VARCHAR2;
  -- FUNCTION GET_COORDINATION_STATUS RETURN VARCHAR2;

  -- PROCEDURE SET_COORDINATION_STATUS;


  -- /**
  --  * Returns the number of the current record.
  --  */
  -- FUNCTION CURRENT_RECORD RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_RECORD RETURN VARCHAR2;

  -- PROCEDURE SET_CURRENT_RECORD;


  -- /**
  --  * Returns the VARCHAR2 name of the named visual attribute of the given block.
  --  */
  -- FUNCTION CURRENT_RECORD_ATTRIBUTE RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_RECORD_ATTRIBUTE RETURN VARCHAR2;

  -- PROCEDURE SET_CURRENT_RECORD_ATTRIBUTE;


  -- /**
  --  * The color of the object’s background region.
  --  */
  -- FUNCTION CURRENT_ROW_BACKGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_BACKGROUND_COLOR RETURN VARCHAR2;

  -- PROCEDURE SET_CURRENT_ROW_BACKGROUND_COLOR;


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


  -- /**
  --  * The color of the object’s foreground region. For items, the Foreground Color attribute defines the color of text displayed in the item.
  --  */
  -- FUNCTION CURRENT_ROW_FOREGROUND_COLOR RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_FOREGROUND_COLOR RETURN VARCHAR2;

  -- PROCEDURE SET_CURRENT_ROW_FOREGROUND_COLOR;


  -- /**
  --  * Specifies that the object is to appear on a monochrome bitmap display device as white text on a black background.
  --  */
  -- FUNCTION CURRENT_ROW_WHITE_ON_BLACK RETURN VARCHAR2;
  -- FUNCTION GET_CURRENT_ROW_WHITE_ON_BLACK RETURN VARCHAR2;

  -- PROCEDURE SET_CURRENT_ROW_WHITE_ON_BLACK;


  /**
   * Returns the default WHERE clause in effect for the block, as indicated by the current setting of the WHERE block property.
   */
  FUNCTION DEFAULT_WHERE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2;
  FUNCTION GET_DEFAULT_WHERE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2;
  FUNCTION WHERE_CLAUSE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2;
  FUNCTION GET_WHERE_CLAUSE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2;

  PROCEDURE SET_DEFAULT_WHERE(P_BLOCK IN STD_BLOCK, P_WHERE_CLAUSE IN VARCHAR2);
  PROCEDURE SET_WHERE_CLAUSE(P_BLOCK IN STD_BLOCK, P_WHERE_CLAUSE IN VARCHAR2);


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the Delete Allowed block property is Yes, FALSE if it is No. This property determines whether the operator or the application is allowed to delete records in the block.
  --  */
  -- FUNCTION DELETE_ALLOWED RETURN VARCHAR2;
  -- FUNCTION GET_DELETE_ALLOWED RETURN VARCHAR2;

  -- PROCEDURE SET_DELETE_ALLOWED;


  -- /**
  --  * Returns the VARCHAR2 name of the block’s DML data source.
  --  */
  -- FUNCTION DML_DATA_TARGET_NAME RETURN VARCHAR2;
  -- FUNCTION GET_DML_DATA_TARGET_NAME RETURN VARCHAR2;

  -- PROCEDURE SET_DML_DATA_TARGET_NAME;


  -- /**
  --  * Returns the VARCHAR2 value that indicates the current setting of the DML Data Target Type property. Return values for this property are NONE, TABLE, STORED PROCEDURE, or TRANSACTIONAL TRIGGER.
  --  */
  -- FUNCTION DML_DATA_TARGET_TYPE RETURN VARCHAR2;
  -- FUNCTION GET_DML_DATA_TARGET_TYPE RETURN VARCHAR2;

  -- PROCEDURE SET_DML_DATA_TARGET_TYPE;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the Enforce Primary Key property is set to Yes for the block. Otherwise, if the Enforce Primary Key property is set to No, this parameter returns the VARCHAR2 value FALSE.
  --  */
  -- FUNCTION ENFORCE_PRIMARY_KEY RETURN VARCHAR2;
  -- FUNCTION GET_ENFORCE_PRIMARY_KEY RETURN VARCHAR2;

  -- PROCEDURE SET_ENFORCE_PRIMARY_KEY;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the block is enterable, that is, if any item in the block has its Enabled and Keyboard Navigable properties set to Yes. Returns the VARCHAR2 string FALSE if the block is not enterable.
  --  */
  -- FUNCTION ENTERABLE RETURN VARCHAR2;
  -- FUNCTION GET_ENTERABLE RETURN VARCHAR2;

  -- PROCEDURE SET_ENTERABLE;


  -- /**
  --  * Returns the VARCHAR2 name of the first relation in which the given block is a detail. Returns NULL if one does not exist.
  --  */
  -- FUNCTION FIRST_DETAIL_RELATION RETURN VARCHAR2;
  -- FUNCTION GET_FIRST_DETAIL_RELATION RETURN VARCHAR2;

  -- PROCEDURE SET_FIRST_DETAIL_RELATION;


  -- /**
  --  * Returns the VARCHAR2 name of the first item in the given block.
  --  */
  -- FUNCTION FIRST_ITEM RETURN VARCHAR2;
  -- FUNCTION GET_FIRST_ITEM RETURN VARCHAR2;

  -- PROCEDURE SET_FIRST_ITEM;


  -- /**
  --  * Returns the VARCHAR2 name of the first relation in which the given block is a master. Returns NULL if one does not exist.
  --  */
  -- FUNCTION FIRST_MASTER_RELATION RETURN VARCHAR2;
  -- FUNCTION GET_FIRST_MASTER_RELATION RETURN VARCHAR2;

  -- PROCEDURE SET_FIRST_MASTER_RELATION;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the Insert Allowed block property is Yes, FALSE if it is No. This property determines whether the operator or the application is allowed to insert records in the block.
  --  */
  -- FUNCTION INSERT_ALLOWED RETURN VARCHAR2;
  -- FUNCTION GET_INSERT_ALLOWED RETURN VARCHAR2;

  -- PROCEDURE SET_INSERT_ALLOWED;


  -- /**
  --  * Returns the VARCHAR2 value that indicates the current setting of the Key Mode block property. Return values for this property are UNIQUE_KEY, UPDATEABLE_PRIMARY_KEY, or NON_UPDATEABLE_PRIMARY_KEY.
  --  */
  -- FUNCTION KEY_MODE RETURN VARCHAR2;
  -- FUNCTION GET_KEY_MODE RETURN VARCHAR2;

  -- PROCEDURE SET_KEY_MODE;


  -- /**
  --  * Returns the name of the last item in the given block.
  --  */
  -- FUNCTION LAST_ITEM RETURN VARCHAR2;
  -- FUNCTION GET_LAST_ITEM RETURN VARCHAR2;

  -- PROCEDURE SET_LAST_ITEM;


  -- /**
  --  * Returns the SQL statement of the last query in the specified block.
  --  */
  -- FUNCTION LAST_QUERY RETURN VARCHAR2;
  -- FUNCTION GET_LAST_QUERY RETURN VARCHAR2;

  -- PROCEDURE SET_LAST_QUERY;


  -- /**
  --  * Returns the VARCHAR2 value IMMEDIATE if rows are to be locked immediately on a change to a base table item; otherwise, it returns the VARCHAR2 value DELAYED if row locks are to be attempted just prior to a commit.
  --  */
  -- FUNCTION LOCKING_MODE RETURN VARCHAR2;
  -- FUNCTION GET_LOCKING_MODE RETURN VARCHAR2;

  -- PROCEDURE SET_LOCKING_MODE;


  -- /**
  --  * Returns the VARCHAR2 value that indicates the current setting of the Maximum Query Time property. This property determines whether the operator can abort a query when the elapsed time of the query exceeds the value of this property.
  --  */
  -- FUNCTION MAX_QUERY_TIME RETURN VARCHAR2;
  -- FUNCTION GET_MAX_QUERY_TIME RETURN VARCHAR2;

  -- PROCEDURE SET_MAX_QUERY_TIME;


  -- /**
  --  * Returns a number representing the maximum number of records that can be fetched. This property is only useful when the Query All Records property is set to Yes.
  --  */
  -- FUNCTION MAX_RECORDS_FETCHED RETURN VARCHAR2;
  -- FUNCTION GET_MAX_RECORDS_FETCHED RETURN VARCHAR2;

  -- PROCEDURE SET_MAX_RECORDS_FETCHED;


  -- /**
  --  * Returns the VARCHAR2 value that indicates the current setting of the block’s NAVIGATION_STYLE property, either SAME_RECORD, CHANGE_RECORD, or CHANGE_BLOCK.
  --  */
  -- FUNCTION NAVIGATION_STYLE RETURN VARCHAR2;
  -- FUNCTION GET_NAVIGATION_STYLE RETURN VARCHAR2;

  -- PROCEDURE SET_NAVIGATION_STYLE;


  -- /**
  --  * Returns the name of the next block. Returns NULL if the indicated block is the last block in the form. Note that the setting of the block’s NEXT_NAVIGATION_BLOCK property has no effect on the value of NEXTBLOCK.
  --  */
  -- FUNCTION NEXTBLOCK RETURN VARCHAR2;
  -- FUNCTION GET_NEXTBLOCK RETURN VARCHAR2;

  -- PROCEDURE SET_NEXTBLOCK;


  -- /**
  --  * Returns the VARCHAR2 name of the block’s next navigation block. By default, the next navigation block is the next block as defined by the order of blocks in the Object Navigator; however, the NEXT_NAVIGATION_BLOCK block property can be set to override the default block navigation sequence.
  --  */
  -- FUNCTION NEXT_NAVIGATION_BLOCK RETURN VARCHAR2;
  -- FUNCTION GET_NEXT_NAVIGATION_BLOCK RETURN VARCHAR2;

  -- PROCEDURE SET_NEXT_NAVIGATION_BLOCK;


  -- /**
  --  * Returns a hint in the form of a VARCHAR2 string that Form Builder passes on to the RDBMS optimizer when constructing queries.
  --  */
  -- FUNCTION OPTIMIZER_HINT RETURN VARCHAR2;
  -- FUNCTION GET_OPTIMIZER_HINT RETURN VARCHAR2;

  -- PROCEDURE SET_OPTIMIZER_HINT;


  -- /**
  --  * Returns the default ORDER BY clause in effect for the block, as indicated by the current setting of the ORDER BY block property.
  --  */
  -- FUNCTION ORDER_BY RETURN VARCHAR2;
  -- FUNCTION GET_ORDER_BY RETURN VARCHAR2;

  -- PROCEDURE SET_ORDER_BY;


  -- /**
  --  * Under Construction] PREVIOUSBLOCK Returns the name of the block that has the next lower sequence in the form, as defined by the order of blocks in the Object Navigator. Returns NULL if the indicated block is the first block in the form. Note that the setting of the block’s PREVIOUS_NAVIGATION_BLOCK property has no effect on the value of PREVIOUSBLOCK.
  --  */
  -- FUNCTION PRECOMPUTE_SUMMARIES RETURN VARCHAR2;
  -- FUNCTION GET_PRECOMPUTE_SUMMARIES RETURN VARCHAR2;

  -- PROCEDURE SET_PRECOMPUTE_SUMMARIES;


  -- /**
  --  * Returns the VARCHAR2 name of the block’s previous navigation block. By default, the previous navigation block is the block with the next lower sequence, as defined by the order of blocks in the Object Navigator; however, the NEXT_NAVIGATION_BLOCK block property can be set to override the default block navigation sequence.
  --  */
  -- FUNCTION PREVIOUS_NAVIGATION_BLOCK RETURN VARCHAR2;
  -- FUNCTION GET_PREVIOUS_NAVIGATION_BLOCK RETURN VARCHAR2;

  -- PROCEDURE SET_PREVIOUS_NAVIGATION_BLOCK;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the Query Allowed block property is Yes, FALSE if it is No. This property determines whether the operator or the application is allowed to query records in the block.
  --  */
  -- FUNCTION QUERY_ALLOWED RETURN VARCHAR2;
  -- FUNCTION GET_QUERY_ALLOWED RETURN VARCHAR2;

  -- PROCEDURE SET_QUERY_ALLOWED;


  -- /**
  --  * Returns the VARCHAR2 name of the block’s query data source.
  --  */
  -- FUNCTION QUERY_DATA_SOURCE_NAME RETURN VARCHAR2;
  -- FUNCTION GET_QUERY_DATA_SOURCE_NAME RETURN VARCHAR2;

  -- PROCEDURE SET_QUERY_DATA_SOURCE_NAME;


  -- /**
  --  * Returns the VARCHAR2 value that indicates the current setting of the Query Data Source Type property. Return values for this property are NONE, TABLE, STORED PROCEDURE, TRANSACTIONAL TRIGGER, or SUB-QUERY.
  --  */
  -- FUNCTION QUERY_DATA_SOURCE_TYPE RETURN VARCHAR2;
  -- FUNCTION GET_QUERY_DATA_SOURCE_TYPE RETURN VARCHAR2;

  -- PROCEDURE SET_QUERY_DATA_SOURCE_TYPE;


  -- /**
  --  * Returns the VARCHAR2 value that indicates the number of records identified by the COUNT_QUERY operation. If this value is examined while records are being retrieved from a query, QUERY_HITS specifies the number of records that have been retrieved.
  --  */
  -- FUNCTION QUERY_HITS RETURN VARCHAR2;
  -- FUNCTION GET_QUERY_HITS RETURN VARCHAR2;

  -- PROCEDURE SET_QUERY_HITS;


  -- /**
  --  * Returns the VARCHAR2 values VIEW, FOR_UPDATE, COUNT_QUERY, or a null value if there are no options. You can call GET_BLOCK_PROPERTY with this parameter from within a transactional trigger when your user exit needs to know what type of query operation Form Builder would be doing by default if you had not circumvented default processing.
  --  */
  -- FUNCTION QUERY_OPTIONS RETURN VARCHAR2;
  -- FUNCTION GET_QUERY_OPTIONS RETURN VARCHAR2;

  -- PROCEDURE SET_QUERY_OPTIONS;


  -- /**
  --  * Returns the number of records that the given block can display. Corresponds to the Number of Records Displayed block property.
  --  */
  -- FUNCTION RECORDS_DISPLAYED RETURN VARCHAR2;
  -- FUNCTION GET_RECORDS_DISPLAYED RETURN VARCHAR2;

  -- PROCEDURE SET_RECORDS_DISPLAYED;


  -- /**
  --  * Returns the number of records Form Builder expects an On-Fetch trigger to fetch and create as queried records.
  --  */
  -- FUNCTION RECORDS_TO_FETCH RETURN VARCHAR2;
  -- FUNCTION GET_RECORDS_TO_FETCH RETURN VARCHAR2;

  -- PROCEDURE SET_RECORDS_TO_FETCH;


  -- /**
  --  * Returns the VARCHAR2 value NEW if the block contains only new records, CHANGED if the block contains at least one changed record, and QUERY if the block contains only valid records that have been retrieved from the database.
  --  */
  -- FUNCTION STATUS RETURN VARCHAR2;
  -- FUNCTION GET_STATUS RETURN VARCHAR2;

  -- PROCEDURE SET_STATUS;


  -- /**
  --  * Returns the record number of the topmost visible record in the given block.
  --  */
  -- FUNCTION TOP_RECORD RETURN VARCHAR2;
  -- FUNCTION GET_TOP_RECORD RETURN VARCHAR2;

  -- PROCEDURE SET_TOP_RECORD;


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the Update Allowed block property is Yes, FALSE if it is No. This property determines whether the operator or the application is allowed to update records in the block.
  --  */
  -- FUNCTION UPDATE_ALLOWED RETURN VARCHAR2;
  -- FUNCTION GET_UPDATE_ALLOWED RETURN VARCHAR2;

  -- PROCEDURE SET_UPDATE_ALLOWED;


  -- /**
  --  * Specifies that only those columns updated by an operator will be sent to the database. When Update Changed Columns Only is set to No, all columns are sent, regardless of whether they have been updated. This can result in considerable network traffic, particularly if the block contains a LONG data type.
  --  */
  -- FUNCTION UPDATE_CHANGED_COLUMNS RETURN VARCHAR2;
  -- FUNCTION GET_UPDATE_CHANGED_COLUMNS RETURN VARCHAR2;

  -- PROCEDURE SET_UPDATE_CHANGED_COLUMNS;


END STD_BLOCK;