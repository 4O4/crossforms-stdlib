CREATE OR REPLACE PACKAGE STD_CONVERT IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
  
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION STRING_TO_OBJECT_STATUS(P_STRING_STATUS IN VARCHAR2) RETURN NUMBER;
  
END STD_CONVERT;