CREATE OR REPLACE PACKAGE STD_RECORD_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Record Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  RS#STATUS                      CONSTANT NUMBER := XFRM.STATUS;
  RS#CHANGED_STATUS              CONSTANT NUMBER := XFRM.CHANGED_STATUS;
  RS#INSERT_STATUS               CONSTANT NUMBER := XFRM.INSERT_STATUS;
  RS#NEW_STATUS                  CONSTANT NUMBER := XFRM.NEW_STATUS;
  RS#QUERY_STATUS                CONSTANT NUMBER := XFRM.QUERY_STATUS;
  
END STD_RECORD_PROPS_PRIVATE;