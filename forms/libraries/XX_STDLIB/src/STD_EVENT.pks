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

  FUNCTION NEW(
    P_EVENT_NAME IN STD_TYPE.EVENT_NAME,
    P_PARENT_EVENT IN STD_EVENT
  ) RETURN STD_EVENT;
  
  FUNCTION IS_NULL(P_EVENT IN STD_EVENT) RETURN BOOLEAN;
	
END STD_EVENT;