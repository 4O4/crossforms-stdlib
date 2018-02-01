CREATE OR REPLACE PACKAGE STD_PROPERTY IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_PROPERTY IS STD_STRUCTURE.STD_PROPERTY;

	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_PROPERTY_NAME IN STD_TYPE.PROPERTY_NAME) RETURN STD_PROPERTY;
  
  FUNCTION IS_NULL(P_PROPERTY IN STD_PROPERTY) RETURN BOOLEAN;
	
END STD_PROPERTY;