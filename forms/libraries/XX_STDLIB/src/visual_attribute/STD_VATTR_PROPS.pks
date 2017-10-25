CREATE OR REPLACE PACKAGE STD_VATTR_PROPS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public namespace for Built-in Visual Attribute Properties
  ------------------------------------------------------------------------------

  BACKGROUND_COLOR               CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#BACKGROUND_COLOR;
  FILL_PATTERN                   CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#FILL_PATTERN;
  FONT_NAME                      CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#FONT_NAME;
  FONT_SIZE                      CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#FONT_SIZE;
  FONT_SPACING                   CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#FONT_SPACING;
  FONT_STYLE                     CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#FONT_STYLE;
  FONT_WEIGHT                    CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#FONT_WEIGHT;
  FOREGROUND_COLOR               CONSTANT NUMBER := STD_VATTR_PROPS_PRIVATE.VAP#FOREGROUND_COLOR;

END STD_VATTR_PROPS;