CREATE OR REPLACE PACKAGE STD_CONSTRAINTS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Max length defs
  ------------------------------------------------------------------------------

  MAX_PROPERTY_VALUE_LENGTH CONSTANT NUMBER := 8191;
  MAX_OBJECT_NAME_LENGTH CONSTANT NUMBER := 30;
  MAX_FULL_ITEM_NAME_LENGTH CONSTANT NUMBER := 61;
  MAX_VARCHAR2_DB_LENGTH CONSTANT NUMBER := 4000;
  MAX_VARCHAR2_PLSQL_LENGTH CONSTANT NUMBER := 32767;

  
END STD_CONSTRAINTS;