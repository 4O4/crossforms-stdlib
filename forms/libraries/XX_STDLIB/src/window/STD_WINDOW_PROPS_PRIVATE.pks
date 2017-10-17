CREATE OR REPLACE PACKAGE STD_WINDOW_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Window Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  WP#BACKGROUND_COLOR            CONSTANT NUMBER := XFRM.BACKGROUND_COLOR;
  WP#DIRECTION                   CONSTANT NUMBER := XFRM.DIRECTION;
  WP#FILL_PATTERN                CONSTANT NUMBER := XFRM.FILL_PATTERN;
  WP#FONT_NAME                   CONSTANT NUMBER := XFRM.FONT_NAME;
  WP#FONT_SIZE                   CONSTANT NUMBER := XFRM.FONT_SIZE;
  WP#FONT_SPACING                CONSTANT NUMBER := XFRM.FONT_SPACING;
  WP#FONT_STYLE                  CONSTANT NUMBER := XFRM.FONT_STYLE;
  WP#FONT_WEIGHT                 CONSTANT NUMBER := XFRM.FONT_WEIGHT;
  WP#FOREGROUND_COLOR            CONSTANT NUMBER := XFRM.FOREGROUND_COLOR;
  WP#HEIGHT                      CONSTANT NUMBER := XFRM.HEIGHT;
  WP#HIDE_ON_EXIT                CONSTANT NUMBER := XFRM.HIDE_ON_EXIT;
  WP#ICON_NAME                   CONSTANT NUMBER := XFRM.ICON_NAME;
  WP#POSITION                    CONSTANT NUMBER := XFRM.POSITION;
  WP#TITLE                       CONSTANT NUMBER := XFRM.TITLE;
  WP#VISIBLE                     CONSTANT NUMBER := XFRM.VISIBLE;
  -- WP#WHITE_ON_BLACK              CONSTANT NUMBER := XFRM.WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  WP#WIDTH                       CONSTANT NUMBER := XFRM.WIDTH;
  WP#WINDOW_HANDLE               CONSTANT NUMBER := XFRM.WINDOW_HANDLE;
  WP#WINDOW_SIZE                 CONSTANT NUMBER := XFRM.WINDOW_SIZE;
  WP#WINDOW_STATE                CONSTANT NUMBER := XFRM.WINDOW_STATE;
  WP#X_POS                       CONSTANT NUMBER := XFRM.X_POS;
  WP#Y_POS                       CONSTANT NUMBER := XFRM.Y_POS;
  
END STD_WINDOW_PROPS_PRIVATE;