CREATE OR REPLACE PACKAGE STD_VATTR IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_VATTR IS STD_STRUCTURE.STD_VATTR;
	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_VISUAL_ATTRIBUTE_NAME IN STD_TYPE.VATTR_NAME) RETURN STD_VATTR;

  FUNCTION IS_NULL(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN BOOLEAN;

  FUNCTION EQUALS(P_VISUAL_ATTRIBUTE_1 IN STD_VATTR, P_VISUAL_ATTRIBUTE_2 IN STD_VATTR) RETURN BOOLEAN;
  
  
  /**
   * The color of the object’s background region.
   */
  FUNCTION BACKGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;
  FUNCTION GET_BACKGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;

  PROCEDURE SET_BACKGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_COLOR IN VARCHAR2);


  /**
   * The pattern to be used for the object’s fill region. Patterns are rendered 
   * in the two colors specified by Background Color and Foreground Color.
   */
  FUNCTION FILL_PATTERN(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;
  FUNCTION GET_FILL_PATTERN(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;

  PROCEDURE SET_FILL_PATTERN(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_PATTERN_NAME IN VARCHAR2);


  /**
   * The font family, or typeface, that should be used for text in the object. 
   * The list of fonts available is system-dependent.
   */
  FUNCTION FONT_NAME(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;
  FUNCTION GET_FONT_NAME(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;

  PROCEDURE SET_FONT_NAME(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_FONT_NAME IN VARCHAR2);


  /**
   * The size of the font, specified in points.
   */
  FUNCTION FONT_SIZE(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN NUMBER;
  FUNCTION GET_FONT_SIZE(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN NUMBER;

  PROCEDURE SET_FONT_SIZE(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_SIZE IN NUMBER);


  /**
   * The width of the font, that is, the amount of space between characters (kerning).
   */
  FUNCTION FONT_SPACING(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;
  FUNCTION GET_FONT_SPACING(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;

  PROCEDURE SET_FONT_SPACING(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_SPACING IN VARCHAR2);


  /**
   * The style of the font.
   */
  FUNCTION FONT_STYLE(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;
  FUNCTION GET_FONT_STYLE(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;

  PROCEDURE SET_FONT_STYLE(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_STYLE IN VARCHAR2);


  /**
   * The weight of the font.
   */
  FUNCTION FONT_WEIGHT(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;
  FUNCTION GET_FONT_WEIGHT(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;

  PROCEDURE SET_FONT_WEIGHT(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_WEIGHT IN VARCHAR2);


  /**
   * The color of the object’s foreground region. For items, the Foreground Color 
   * attribute defines the color of text displayed in the item.
   */
  FUNCTION FOREGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;
  FUNCTION GET_FOREGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR) RETURN VARCHAR2;

  PROCEDURE SET_FOREGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR, P_COLOR IN VARCHAR2);


  PROCEDURE RESET_BACKGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  PROCEDURE RESET_FILL_PATTERN(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  PROCEDURE RESET_FONT_NAME(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  PROCEDURE RESET_FONT_SIZE(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  PROCEDURE RESET_FONT_SPACING(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  PROCEDURE RESET_FONT_STYLE(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  PROCEDURE RESET_FONT_WEIGHT(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  PROCEDURE RESET_FOREGROUND_COLOR(P_VISUAL_ATTRIBUTE IN STD_VATTR);

  
END STD_VATTR;