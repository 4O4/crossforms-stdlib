CREATE OR REPLACE PACKAGE STD_EVENT IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_EVENT IS STD_STRUCTURE.STD_EVENT;

	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_EVENT_NAME IN STD_TYPE.EVENT_NAME) RETURN STD_EVENT;
	
END STD_EVENT;