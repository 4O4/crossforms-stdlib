CREATE OR REPLACE PACKAGE STD_CANVAS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_CANVAS IS STD_STRUCTURE.STD_CANVAS;
	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_CANVAS_NAME IN STD_TYPE.CANVAS_NAME) RETURN STD_CANVAS;

  FUNCTION IS_NULL(P_CANVAS IN STD_CANVAS) RETURN BOOLEAN;

  FUNCTION EQUALS(P_CANVAS_1 IN STD_CANVAS, P_CANVAS_2 IN STD_CANVAS) RETURN BOOLEAN;

  PROCEDURE SHOW(P_CANVAS IN STD_CANVAS);

  PROCEDURE HIDE(P_CANVAS IN STD_CANVAS);
  
  /**
   * The color of the object’s background region.
   */
  FUNCTION BACKGROUND_COLOR(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_BACKGROUND_COLOR(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_BACKGROUND_COLOR(P_CANVAS IN STD_CANVAS, P_COLOR IN VARCHAR2);


  /**
   * The pattern to be used for the object’s fill region. Patterns are rendered 
   * in the two colors specified by Background Color and Foreground Color.
   */
  FUNCTION FILL_PATTERN(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_FILL_PATTERN(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_FILL_PATTERN(P_CANVAS IN STD_CANVAS, P_PATTERN_NAME IN VARCHAR2);


  /**
   * The font family, or typeface, that should be used for text in the object. 
   * The list of fonts available is system-dependent.
   */
  FUNCTION FONT_NAME(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_FONT_NAME(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_FONT_NAME(P_CANVAS IN STD_CANVAS, P_FONT_NAME IN VARCHAR2);


  /**
   * The size of the font, specified in points.
   */
  FUNCTION FONT_SIZE(P_CANVAS IN STD_CANVAS) RETURN NUMBER;
  FUNCTION GET_FONT_SIZE(P_CANVAS IN STD_CANVAS) RETURN NUMBER;

  PROCEDURE SET_FONT_SIZE(P_CANVAS IN STD_CANVAS, P_SIZE IN NUMBER);


  /**
   * The width of the font, that is, the amount of space between characters (kerning).
   */
  FUNCTION FONT_SPACING(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_FONT_SPACING(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_FONT_SPACING(P_CANVAS IN STD_CANVAS, P_SPACING IN VARCHAR2);


  /**
   * The style of the font.
   */
  FUNCTION FONT_STYLE(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_FONT_STYLE(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_FONT_STYLE(P_CANVAS IN STD_CANVAS, P_STYLE IN VARCHAR2);


  /**
   * The weight of the font.
   */
  FUNCTION FONT_WEIGHT(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_FONT_WEIGHT(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_FONT_WEIGHT(P_CANVAS IN STD_CANVAS, P_WEIGHT IN VARCHAR2);


  /**
   * The color of the object’s foreground region. For items, the Foreground Color 
   * attribute defines the color of text displayed in the item.
   */
  FUNCTION FOREGROUND_COLOR(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_FOREGROUND_COLOR(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_FOREGROUND_COLOR(P_CANVAS IN STD_CANVAS, P_COLOR IN VARCHAR2);


  /**
   * Returns the height of the canvas, specified in the form coordinate units 
   * indicated by the Coordinate System form property.
   */
  FUNCTION HEIGHT(P_CANVAS IN STD_CANVAS) RETURN NUMBER;
  FUNCTION GET_HEIGHT(P_CANVAS IN STD_CANVAS) RETURN NUMBER;

  PROCEDURE SET_HEIGHT(P_CANVAS IN STD_CANVAS, P_HEIGHT IN NUMBER);


  /**
   * Returns the distance between the left edge of the tab canvas and the left 
   * edge of the tab page. The value returned depends on the form coordinate 
   * system — pixel, centimeter, inch, or point.
   */
  FUNCTION TAB_PAGE_X_OFFSET(P_CANVAS IN STD_CANVAS) RETURN NUMBER;
  FUNCTION GET_TAB_PAGE_X_OFFSET(P_CANVAS IN STD_CANVAS) RETURN NUMBER;


  /**
   * Returns the distance between the top edge of the tab canvas and the top edge
   * of the tab page. The value returned depends on the form coordinate system — 
   * pixel, centimeter, inch, or point.
   */
  FUNCTION TAB_PAGE_Y_OFFSET(P_CANVAS IN STD_CANVAS) RETURN NUMBER;
  FUNCTION GET_TAB_PAGE_Y_OFFSET(P_CANVAS IN STD_CANVAS) RETURN NUMBER;


  /**
   * Returns the tab page currently topmost on the named tab canvas.
   */
  FUNCTION TOPMOST_TAB_PAGE(P_CANVAS IN STD_CANVAS) RETURN STD_TAB_PAGE.STD_TAB_PAGE;
  FUNCTION GET_TOPMOST_TAB_PAGE(P_CANVAS IN STD_CANVAS) RETURN STD_TAB_PAGE.STD_TAB_PAGE;

  PROCEDURE SET_TOPMOST_TAB_PAGE(P_CANVAS IN STD_CANVAS, P_TAB_PAGE IN STD_TAB_PAGE.STD_TAB_PAGE);


  /**
   * Returns the width of the canvas, specified in the form coordinate units indicated 
   * by the Coordinate System form property.
   */
  FUNCTION WIDTH(P_CANVAS IN STD_CANVAS) RETURN NUMBER;
  FUNCTION GET_WIDTH(P_CANVAS IN STD_CANVAS) RETURN NUMBER;

  PROCEDURE SET_WIDTH(P_CANVAS IN STD_CANVAS, P_WIDTH IN NUMBER);


  /**
   * Returns the name of the visual attribute currently in force. If no named visual
   * attribute is assigned to the canvas, returns CUSTOM for a custom visual attribute
   * or DEFAULT for a default visual attribute.
   */
  FUNCTION VISUAL_ATTRIBUTE(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;
  FUNCTION GET_VISUAL_ATTRIBUTE(P_CANVAS IN STD_CANVAS) RETURN VARCHAR2;

  PROCEDURE SET_VISUAL_ATTRIBUTE(P_CANVAS IN STD_CANVAS, P_VISUAL_ATTRIBUTE_NAME IN VARCHAR2);

END STD_CANVAS;