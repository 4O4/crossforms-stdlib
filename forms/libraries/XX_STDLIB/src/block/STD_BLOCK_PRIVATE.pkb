CREATE OR REPLACE PACKAGE BODY STD_BLOCK_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Private API
  ------------------------------------------------------------------------------

  PROCEDURE VALIDATE_VERBOSE IS
  BEGIN
    VALIDATE(BLOCK_SCOPE);

    IF NOT FORM_SUCCESS THEN
      RAISE FORM_TRIGGER_FAILURE;
    END IF;
  END VALIDATE_VERBOSE;
  

END STD_BLOCK_PRIVATE;