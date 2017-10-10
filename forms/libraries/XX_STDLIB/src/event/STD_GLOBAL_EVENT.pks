CREATE OR REPLACE PACKAGE STD_GLOBAL_EVENT IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  PROCEDURE SET(P_EVENT IN STD_EVENT.STD_EVENT);

  FUNCTION POP RETURN STD_EVENT.STD_EVENT;
	
END STD_GLOBAL_EVENT;