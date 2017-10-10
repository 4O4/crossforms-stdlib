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
  
END STD_BLOCK;