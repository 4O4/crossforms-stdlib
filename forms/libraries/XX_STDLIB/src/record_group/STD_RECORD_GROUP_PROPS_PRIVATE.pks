CREATE OR REPLACE PACKAGE STD_RECORD_GROUP_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Record Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  RG#ALL_ROWS                      CONSTANT NUMBER := XFRM.ALL_ROWS;
  
END STD_RECORD_GROUP_PROPS_PRIVATE;