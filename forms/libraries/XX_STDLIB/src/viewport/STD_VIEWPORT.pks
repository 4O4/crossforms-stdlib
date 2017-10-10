CREATE OR REPLACE PACKAGE STD_VIEWPORT IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_VIEWPORT IS STD_STRUCTURE.STD_VIEWPORT;

	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_VIEWPORT_NAME IN STD_TYPE.VIEWPORT_NAME) RETURN STD_VIEWPORT;

  FUNCTION IS_NULL(P_VIEWPORT IN STD_VIEWPORT) RETURN BOOLEAN;

  FUNCTION EQUALS(P_VIEWPORT_1 IN STD_VIEWPORT, P_VIEWPORT_2 IN STD_VIEWPORT) RETURN BOOLEAN;

  PROCEDURE SHOW(P_VIEWPORT IN STD_VIEWPORT);

  PROCEDURE HIDE(P_VIEWPORT IN STD_VIEWPORT);

  -- /**
  --  * Returns the layout direction for bidirectional objects. Valid return values are RIGHT_TO_LEFT, LEFT_TO_RIGHT.
  --  */
  -- FUNCTION DIRECTION(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;
  -- FUNCTION GET_DIRECTION(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;

  -- PROCEDURE SET_DIRECTION(P_VIEWPORT IN STD_VIEWPORT, P_ IN VARCHAR2);


  -- /**
  --  * Returns the height of the view. For a content view, the height of the view is actually the height of the window in which the view is currently displayed. The size of each unit depends on how you defined the Coordinate System property for the form module.
  --  */
  -- FUNCTION HEIGHT(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;
  -- FUNCTION GET_HEIGHT(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;

  -- PROCEDURE SET_HEIGHT(P_VIEWPORT IN STD_VIEWPORT, P_ IN VARCHAR2);


  -- /**
  --  * For a stacked canvas, returns the x coordinate that reflects the current placement of the view’s upper left corner relative to the upper left corner of the window’s current content canvas. For a content view, returns 0. The value is returned as a VARCHAR2 and is expressed in the units defined by the form module Coordinate System property.
  --  */
  -- FUNCTION VIEWPORT_X_POS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;
  -- FUNCTION GET_VIEWPORT_X_POS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;

  -- PROCEDURE SET_VIEWPORT_X_POS(P_VIEWPORT IN STD_VIEWPORT, P_ IN VARCHAR2);


  -- /**
  --  * For a stacked canvas, returns the y coordinate that reflects the current placement of the view’s upper left corner relative to the upper left corner of the window’s current content canvas. For a content view, returns 0. The value is returned as a VARCHAR2 and is expressed in the units defined by the form module Coordinate System property.
  --  */
  -- FUNCTION VIEWPORT_Y_POS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;
  -- FUNCTION GET_VIEWPORT_Y_POS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;

  -- PROCEDURE SET_VIEWPORT_Y_POS(P_VIEWPORT IN STD_VIEWPORT, P_ IN VARCHAR2);


  -- /**
  --  * Returns the x coordinate that reflects the current placement of the view’s upper left corner relative to the upper left corner of its canvas. The value is returned as a VARCHAR2 and is expressed in the units defined by the form module Coordinate System property.
  --  */
  -- FUNCTION VIEWPORT_X_POS_ON_CANVAS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;
  -- FUNCTION GET_VIEWPORT_X_POS_ON_CANVAS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;

  -- PROCEDURE SET_VIEWPORT_X_POS_ON_CANVAS(P_VIEWPORT IN STD_VIEWPORT, P_ IN VARCHAR2);


  -- /**
  --  * Returns the y coordinate that reflects the current placement of the view’s upper left corner relative to the upper left corner of its canvas. The value is returned as a VARCHAR2 and is expressed in the units defined by the form module Coordinate System property.
  --  */
  -- FUNCTION VIEWPORT_Y_POS_ON_CANVAS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;
  -- FUNCTION GET_VIEWPORT_Y_POS_ON_CANVAS(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;

  -- PROCEDURE SET_VIEWPORT_Y_POS_ON_CANVAS(P_VIEWPORT IN STD_VIEWPORT, P_ IN VARCHAR2);


  /**
   * Returns the BOOLEAN value TRUE if the view is visible, FALSE if it is not. A view is reported visible when it is a) in front of all other views in the window or b) only partially obscured by another view. A view is reported not visible when it is a) a stacked view that is behind the content view or b) completely obscured by a single stacked view. Note that this property is independent of the current window display state. Thus a view can be reported visible even when its window is currently hidden or iconified.
   */
  FUNCTION VISIBLE(P_VIEWPORT IN STD_VIEWPORT) RETURN BOOLEAN;
  FUNCTION GET_VISIBLE(P_VIEWPORT IN STD_VIEWPORT) RETURN BOOLEAN;

  PROCEDURE SET_VISIBLE(P_VIEWPORT IN STD_VIEWPORT, P_VISIBLE IN BOOLEAN);


  -- /**
  --  * Returns the width of the view. For a content view, the width of the view is actually the width of the window in which the view is currently displayed. The size of each unit depends on how you defined the Coordinate System property for the form module.
  --  */
  -- FUNCTION WIDTH(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;
  -- FUNCTION GET_WIDTH(P_VIEWPORT IN STD_VIEWPORT) RETURN VARCHAR2;

  -- PROCEDURE SET_WIDTH(P_VIEWPORT IN STD_VIEWPORT, P_ IN VARCHAR2);


  -- /**
  --  * Returns the window where this canvas is displayed.
  --  */
  -- FUNCTION WINDOW(P_VIEWPORT IN STD_VIEWPORT) RETURN STD_STRUCTURE.STD_WINDOW;
  -- FUNCTION GET_WINDOW(P_VIEWPORT IN STD_VIEWPORT) RETURN STD_STRUCTURE.STD_WINDOW;


END STD_VIEWPORT;