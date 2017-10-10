CREATE OR REPLACE PACKAGE STD_CANVAS_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Canvas Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  CP#BACKGROUND_COLOR            CONSTANT NUMBER := XFRM.BACKGROUND_COLOR;
  CP#FILL_PATTERN                CONSTANT NUMBER := XFRM.FILL_PATTERN;
  CP#FONT_NAME                   CONSTANT NUMBER := XFRM.FONT_NAME;
  CP#FONT_SIZE                   CONSTANT NUMBER := XFRM.FONT_SIZE;
  CP#FONT_SPACING                CONSTANT NUMBER := XFRM.FONT_SPACING;
  CP#FONT_STYLE                  CONSTANT NUMBER := XFRM.FONT_STYLE;
  CP#FONT_WEIGHT                 CONSTANT NUMBER := XFRM.FONT_WEIGHT;
  CP#FOREGROUND_COLOR            CONSTANT NUMBER := XFRM.FOREGROUND_COLOR;
  CP#HEIGHT                      CONSTANT NUMBER := XFRM.HEIGHT;
  CP#TAB_PAGE_X_OFFSET           CONSTANT NUMBER := XFRM.TAB_PAGE_X_OFFSET;
  CP#TAB_PAGE_Y_OFFSET           CONSTANT NUMBER := XFRM.TAB_PAGE_Y_OFFSET;
  CP#TOPMOST_TAB_PAGE            CONSTANT NUMBER := XFRM.TOPMOST_TAB_PAGE;
  -- CP#WHITE_ON_BLACK              CONSTANT NUMBER := XFRM.WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  CP#WIDTH                       CONSTANT NUMBER := XFRM.WIDTH;
  CP#VISUAL_ATTRIBUTE            CONSTANT NUMBER := XFRM.VISUAL_ATTRIBUTE;
  
END STD_CANVAS_PROPS_PRIVATE;