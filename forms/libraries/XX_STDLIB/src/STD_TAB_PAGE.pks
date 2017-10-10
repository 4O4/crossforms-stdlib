CREATE OR REPLACE PACKAGE STD_TAB_PAGE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_TAB_PAGE IS STD_STRUCTURE.STD_TAB_PAGE;

	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_TAB_PAGE_NAME IN STD_TYPE.TAB_PAGE_NAME) RETURN STD_TAB_PAGE;

  FUNCTION IS_NULL(P_TAB_PAGE IN STD_TAB_PAGE) RETURN BOOLEAN;

  FUNCTION EQUALS(P_TAB_PAGE_1 IN STD_TAB_PAGE, P_TAB_PAGE_2 IN STD_TAB_PAGE) RETURN BOOLEAN;
  
  /**
   * The color of the object’s background region.
   */
  -- FUNCTION BACKGROUND_COLOR(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_BACKGROUND_COLOR(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_BACKGROUND_COLOR(P_TAB_PAGE IN STD_TAB_PAGE, P_BACKGROUND_COLOR IN VARCHAR2);


  /**
   * Returns the VARCHAR2 name of the canvas to whic h the tab page belongs.
   */
  FUNCTION CANVAS(P_TAB_PAGE IN STD_TAB_PAGE) RETURN STD_STRUCTURE.STD_CANVAS;
  FUNCTION GET_CANVAS(P_TAB_PAGE IN STD_TAB_PAGE) RETURN STD_STRUCTURE.STD_CANVAS;

  PROCEDURE SET_CANVAS(P_TAB_PAGE IN STD_TAB_PAGE, P_CANVAS IN STD_STRUCTURE.STD_CANVAS);


  -- /**
  --  * Returns the VARCHAR2 string TRUE if a tab page i s enabled, FALSE if it is disabled (i.e., greyed out and unavailable).
  --  */
  -- FUNCTION ENABLED(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_ENABLED(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_ENABLED(P_TAB_PAGE IN STD_TAB_PAGE, P_ENABLED IN VARCHAR2);


  -- /**
  --  * The pattern to be used for the object’s fill region. Patterns are rendered in the two colors specified by Background Color an d Foreground Color.
  --  */
  -- FUNCTION FILL_PATTERN(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_FILL_PATTERN(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_FILL_PATTERN(P_TAB_PAGE IN STD_TAB_PAGE, P_FILL_PATTERN IN VARCHAR2);


  -- /**
  --  * The font family, or typeface, that should be used for text i n the object. The list of fonts available is system-dependent.
  --  */
  -- FUNCTION FONT_NAME(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_FONT_NAME(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_FONT_NAME(P_TAB_PAGE IN STD_TAB_PAGE, P_FONT_NAME IN VARCHAR2);


  -- /**
  --  * The size of the font, specified in points.
  --  */
  -- FUNCTION FONT_SIZE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_FONT_SIZE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_FONT_SIZE(P_TAB_PAGE IN STD_TAB_PAGE, P_FONT_SIZE IN VARCHAR2);


  -- /**
  --  * The width of the font, that is, the amount of spac e between characters (kerning).
  --  */
  -- FUNCTION FONT_SPACING(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_FONT_SPACING(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_FONT_SPACING(P_TAB_PAGE IN STD_TAB_PAGE, P_FONT_SPACING IN VARCHAR2);


  -- /**
  --  * The style of the font.
  --  */
  -- FUNCTION FONT_STYLE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_FONT_STYLE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_FONT_STYLE(P_TAB_PAGE IN STD_TAB_PAGE, P_FONT_STYLE IN VARCHAR2);


  -- /**
  --  * The weight of the font.
  --  */
  -- FUNCTION FONT_WEIGHT(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_FONT_WEIGHT(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_FONT_WEIGHT(P_TAB_PAGE IN STD_TAB_PAGE, P_FONT_WEIGHT IN VARCHAR2);


  -- /**
  --  * The color of the object’s foreground region. For items, the Foreground Color attribute defines the color of text displaye d in the item.
  --  */
  -- FUNCTION FOREGROUND_COLOR(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_FOREGROUND_COLOR(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_FOREGROUND_COLOR(P_TAB_PAGE IN STD_TAB_PAGE, P_FOREGROUND_COLOR IN VARCHAR2);


  -- /**
  --  * Returns the VARCHAR2 string for the tab page label.
  --  */
  -- FUNCTION LABEL(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_LABEL(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_LABEL(P_TAB_PAGE IN STD_TAB_PAGE, P_LABEL IN VARCHAR2);


  -- /**
  --  * Returns the VARCHAR2 value TRUE if the tab page is visible , FALSE if it is not. A tab page is reported visible if it is currently mappe d to the screen, even if it is entirely hidden behind another tab page.
  --  */
  -- FUNCTION VISIBLE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_VISIBLE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_VISIBLE(P_TAB_PAGE IN STD_TAB_PAGE, P_VISIBLE IN VARCHAR2);


  -- /**
  --  * Returns the name of the visual attribute currentl y in force. If no named visual attribute is assigned to the tab page, return s CUSTOM for a custom visual attribute or DEFAULT for a default visua l attribute.
  --  */
  -- FUNCTION VISUAL_ATTRIBUTE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;
  -- FUNCTION GET_VISUAL_ATTRIBUTE(P_TAB_PAGE IN STD_TAB_PAGE) RETURN VARCHAR2;

  -- PROCEDURE SET_VISUAL_ATTRIBUTE(P_TAB_PAGE IN STD_TAB_PAGE, P_VISUAL_ATTRIBUTE IN VARCHAR2);



END STD_TAB_PAGE;