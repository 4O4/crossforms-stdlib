CREATE OR REPLACE PACKAGE STD_TAB_PAGE_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Tab Page Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  TPP#BACKGROUND_COLOR           CONSTANT NUMBER := XFRM.BACKGROUND_COLOR;
  TPP#CANVAS_NAME                CONSTANT NUMBER := XFRM.CANVAS_NAME;
  TPP#ENABLED                    CONSTANT NUMBER := XFRM.ENABLED;
  TPP#FILL_PATTERN               CONSTANT NUMBER := XFRM.FILL_PATTERN;
  TPP#FONT_NAME                  CONSTANT NUMBER := XFRM.FONT_NAME;
  TPP#FONT_SIZE                  CONSTANT NUMBER := XFRM.FONT_SIZE;
  TPP#FONT_SPACING               CONSTANT NUMBER := XFRM.FONT_SPACING;
  TPP#FONT_STYLE                 CONSTANT NUMBER := XFRM.FONT_STYLE;
  TPP#FONT_WEIGHT                CONSTANT NUMBER := XFRM.FONT_WEIGHT;
  TPP#FOREGROUND_COLOR           CONSTANT NUMBER := XFRM.FOREGROUND_COLOR;
  TPP#LABEL                      CONSTANT NUMBER := XFRM.LABEL;
  TPP#VISIBLE                    CONSTANT NUMBER := XFRM.VISIBLE;
  TPP#VISUAL_ATTRIBUTE           CONSTANT NUMBER := XFRM.VISUAL_ATTRIBUTE;
  -- TPP#WHITE_ON_BLACK             CONSTANT NUMBER := XFRM.WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  
END STD_TAB_PAGE_PROPS_PRIVATE;