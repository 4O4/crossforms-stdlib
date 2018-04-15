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

  FUNCTION TO_BOOLEAN(P_VALUE IN VARCHAR2) RETURN BOOLEAN;
  
  FUNCTION CLOB_TO_CLOB_CHUNKS(
    P_DATA IN OUT NOCOPY CLOB, 
    P_MAX_CHUNK_SIZE IN INTEGER
  ) RETURN STD_TYPE.CLOB_CHUNKS;

  FUNCTION TO_STRING(P_VALUE IN BOOLEAN) RETURN VARCHAR2;
  
END STD_CONVERT;