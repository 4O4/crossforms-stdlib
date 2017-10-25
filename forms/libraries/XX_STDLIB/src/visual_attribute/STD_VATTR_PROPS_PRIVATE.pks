CREATE OR REPLACE PACKAGE STD_VATTR_PROPS_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Visual Attribute Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  VAP#BACKGROUND_COLOR           CONSTANT NUMBER := XFRM.BACKGROUND_COLOR;
  VAP#FILL_PATTERN               CONSTANT NUMBER := XFRM.FILL_PATTERN;
  VAP#FONT_NAME                  CONSTANT NUMBER := XFRM.FONT_NAME;
  VAP#FONT_SIZE                  CONSTANT NUMBER := XFRM.FONT_SIZE;
  VAP#FONT_SPACING               CONSTANT NUMBER := XFRM.FONT_SPACING;
  VAP#FONT_STYLE                 CONSTANT NUMBER := XFRM.FONT_STYLE;
  VAP#FONT_WEIGHT                CONSTANT NUMBER := XFRM.FONT_WEIGHT;
  VAP#FOREGROUND_COLOR           CONSTANT NUMBER := XFRM.FOREGROUND_COLOR;
  -- VAP#WHITE_ON_BLACK             CONSTANT NUMBER := XFRM.WHITE_ON_BLACK; -- Not available in Oracle Forms >= 10g
  
END STD_VATTR_PROPS_PRIVATE;