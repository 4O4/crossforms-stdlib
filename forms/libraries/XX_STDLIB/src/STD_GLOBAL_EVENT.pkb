CREATE OR REPLACE PACKAGE BODY STD_GLOBAL_EVENT IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */


  ------------------------------------------------------------------------------
  -- Private globals
  ------------------------------------------------------------------------------

  G_CURRENT_EVENT STD_EVENT.STD_EVENT;
	

  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------
  
  PROCEDURE SET(P_EVENT IN STD_EVENT.STD_EVENT) IS
  BEGIN
    G_CURRENT_EVENT := P_EVENT;
  END SET;


  FUNCTION POP RETURN STD_EVENT.STD_EVENT IS
    L_NULL_EVENT STD_EVENT.STD_EVENT;
    L_CURRENT_EVENT STD_EVENT.STD_EVENT := G_CURRENT_EVENT;
  BEGIN
    G_CURRENT_EVENT := L_NULL_EVENT;

    RETURN L_CURRENT_EVENT;
  END POP;
	
END STD_GLOBAL_EVENT;