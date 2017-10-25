CREATE OR REPLACE PACKAGE STD_RECORD_PROPS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public namespace for Built-in Record Properties
  ------------------------------------------------------------------------------

  STATUS                         CONSTANT NUMBER := STD_RECORD_PROPS_PRIVATE.RS#STATUS;
  CHANGED_STATUS                 CONSTANT NUMBER := STD_RECORD_PROPS_PRIVATE.RS#CHANGED_STATUS;
  INSERT_STATUS                  CONSTANT NUMBER := STD_RECORD_PROPS_PRIVATE.RS#INSERT_STATUS;
  NEW_STATUS                     CONSTANT NUMBER := STD_RECORD_PROPS_PRIVATE.RS#NEW_STATUS;
  QUERY_STATUS                   CONSTANT NUMBER := STD_RECORD_PROPS_PRIVATE.RS#QUERY_STATUS;

END STD_RECORD_PROPS;