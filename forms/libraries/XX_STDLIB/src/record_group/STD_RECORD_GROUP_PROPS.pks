CREATE OR REPLACE PACKAGE STD_RECORD_GROUP_PROPS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public namespace for Built-in Record Properties
  ------------------------------------------------------------------------------

  ALL_ROWS                         CONSTANT NUMBER := STD_RECORD_GROUP_PROPS_PRIVATE.RG#ALL_ROWS;

END STD_RECORD_GROUP_PROPS;