CREATE OR REPLACE PACKAGE STD_VIEWPORT_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in ViewPort Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  VP#DIRECTION                   CONSTANT NUMBER := XFRM.DIRECTION;
  VP#HEIGHT                      CONSTANT NUMBER := XFRM.HEIGHT;
  VP#VIEWPORT_X_POS              CONSTANT NUMBER := XFRM.VIEWPORT_X_POS;
  VP#VIEWPORT_Y_POS              CONSTANT NUMBER := XFRM.VIEWPORT_Y_POS;
  VP#VIEWPORT_X_POS_ON_CANVAS    CONSTANT NUMBER := XFRM.VIEWPORT_X_POS_ON_CANVAS;
  VP#VIEWPORT_Y_POS_ON_CANVAS    CONSTANT NUMBER := XFRM.VIEWPORT_Y_POS_ON_CANVAS;
  VP#VISIBLE                     CONSTANT NUMBER := XFRM.VISIBLE;
  VP#WIDTH                       CONSTANT NUMBER := XFRM.WIDTH;
  VP#WINDOW_NAME                 CONSTANT NUMBER := XFRM.WINDOW_NAME;
  
END STD_VIEWPORT_PROPS_PRIVATE;