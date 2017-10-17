CREATE OR REPLACE PACKAGE STD_WINDOW IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_WINDOW IS STD_STRUCTURE.STD_WINDOW;

	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_WINDOW_NAME IN STD_TYPE.WINDOW_NAME) RETURN STD_WINDOW;

  FUNCTION IS_NULL(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN;

  FUNCTION EQUALS(P_WINDOW_1 IN STD_WINDOW, P_WINDOW_2 IN STD_WINDOW) RETURN BOOLEAN;

  PROCEDURE SHOW(P_WINDOW IN STD_WINDOW);

  PROCEDURE HIDE(P_WINDOW IN STD_WINDOW);


  /**
   * The color of the object’s background region.
   */
  FUNCTION BACKGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_BACKGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_BACKGROUND_COLOR(P_WINDOW IN STD_WINDOW, P_BACKGROUND_COLOR IN VARCHAR2);


  /**
   * Returns the layout direction for bidirectional objects. Valid return values
   * are RIGHT_TO_LEFT, LEFT_TO_RIGHT.
   */
  FUNCTION DIRECTION(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_DIRECTION(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_DIRECTION(P_WINDOW IN STD_WINDOW, P_DIRECTION IN VARCHAR2);


  /**
   * The pattern to be used for the object’s fill region. Patterns are rendered 
   * in the two colors specified by Background Color and Foreground Color.
   */
  FUNCTION FILL_PATTERN(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_FILL_PATTERN(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_FILL_PATTERN(P_WINDOW IN STD_WINDOW, P_PATTERN_NAME IN VARCHAR2);


  /**
   * The font family, or typeface, that should be used for text in the object.
   * The list of fonts available is system-dependent.
   */
  FUNCTION FONT_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_FONT_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_FONT_NAME(P_WINDOW IN STD_WINDOW, P_FONT_NAME IN VARCHAR2);


  /**
   * The size of the font, specified in points.
   */
  FUNCTION FONT_SIZE(P_WINDOW IN STD_WINDOW) RETURN NUMBER;
  FUNCTION GET_FONT_SIZE(P_WINDOW IN STD_WINDOW) RETURN NUMBER;

  PROCEDURE SET_FONT_SIZE(P_WINDOW IN STD_WINDOW, P_SIZE IN NUMBER);


  /**
   * The width of the font, that is, the amount of space between characters (kerning).
   */
  FUNCTION FONT_SPACING(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_FONT_SPACING(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_FONT_SPACING(P_WINDOW IN STD_WINDOW, P_SPACING IN VARCHAR2);


  /**
   * The style of the font.
   */
  FUNCTION FONT_STYLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_FONT_STYLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_FONT_STYLE(P_WINDOW IN STD_WINDOW, P_STYLE IN VARCHAR2);


  /**
   * The weight of the font.
   */
  FUNCTION FONT_WEIGHT(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_FONT_WEIGHT(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_FONT_WEIGHT(P_WINDOW IN STD_WINDOW, P_WEIGHT IN VARCHAR2);


  /**
   * The color of the object’s foreground region. For items, the Foreground Color
   * attribute defines the color of text displayed in the item.
   */
  FUNCTION FOREGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_FOREGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_FOREGROUND_COLOR(P_WINDOW IN STD_WINDOW, P_COLOR IN VARCHAR2);


  /**
   * Returns the height of the window.
   */
  FUNCTION HEIGHT(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_HEIGHT(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_HEIGHT(P_WINDOW IN STD_WINDOW, P_HEIGHT IN VARCHAR2);


  /**
   * Returns the BOOLEAN value TRUE if the window has the Remove On Exit property 
   * set to Yes, otherwise, it is FALSE.
   */
  FUNCTION HIDE_ON_EXIT(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN;
  FUNCTION GET_HIDE_ON_EXIT(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN;

  PROCEDURE SET_HIDE_ON_EXIT(P_WINDOW IN STD_WINDOW, P_STATE IN BOOLEAN);


  /**
   * Returns the file name of the icon resource associated with a window item when
   * it is minimized.
   */
  FUNCTION ICON_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_ICON_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_ICON_NAME(P_WINDOW IN STD_WINDOW, P_ICON_NAME IN VARCHAR2);


  /**
   * Returns the title of the window.
   */
  FUNCTION TITLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_TITLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_TITLE(P_WINDOW IN STD_WINDOW, P_TITLE IN VARCHAR2);


  /**
   * Returns the BOOLEAN value TRUE if the window is visible, FALSE if it is not. 
   * A window is reported visible if it is currently mapped to the screen, even if
   * it is entirely hidden behind another window or iconified (minimized).
   */
  FUNCTION VISIBLE(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN;
  FUNCTION GET_VISIBLE(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN;

  PROCEDURE SET_VISIBLE(P_WINDOW IN STD_WINDOW, P_VISIBLE IN BOOLEAN);


  /**
   * Returns the width of the window.
   */
  FUNCTION WIDTH(P_WINDOW IN STD_WINDOW) RETURN NUMBER;
  FUNCTION GET_WIDTH(P_WINDOW IN STD_WINDOW) RETURN NUMBER;

  PROCEDURE SET_WIDTH(P_WINDOW IN STD_WINDOW, P_WIDTH IN NUMBER);


  /**
   * Returns the a unique internal VARCHAR2 constant that is used to refer to objects. 
   * Returns the number 0 if the platform is not Microsoft Windows.
   */
  FUNCTION WINDOW_HANDLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_WINDOW_HANDLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;


  /**
   * Returns the current display state of the window. The display state of a window 
   * is the VARCHAR2 string NORMAL, MAXIMIZE, or MINIMIZE.
   */
  FUNCTION WINDOW_STATE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;
  FUNCTION GET_WINDOW_STATE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2;

  PROCEDURE SET_WINDOW_STATE(P_WINDOW IN STD_WINDOW, P_STATE IN VARCHAR2);


  /**
   * Returns the x coordinate that reflects the window’s current display position 
   * on the screen.
   */
  FUNCTION X_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER;
  FUNCTION GET_X_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER;

  PROCEDURE SET_X_POS(P_WINDOW IN STD_WINDOW, P_X_POS IN NUMBER);


  /**
   * Returns the y coordinate that reflects the window’s current display position 
   * on the screen.
   */
  FUNCTION Y_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER;
  FUNCTION GET_Y_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER;

  PROCEDURE SET_Y_POS(P_WINDOW IN STD_WINDOW, P_Y_POS IN NUMBER);


END STD_WINDOW;