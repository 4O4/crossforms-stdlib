CREATE OR REPLACE PACKAGE BODY STD_WINDOW IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Private API declarations
  ------------------------------------------------------------------------------

  FUNCTION GET_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER) RETURN VARCHAR2;
  
  PROCEDURE SET_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2);

  FUNCTION GET_NUMBER_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER) RETURN NUMBER;
  
  PROCEDURE SET_NUMBER_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER);

  FUNCTION GET_BOOLEAN_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER) RETURN BOOLEAN;
  
  PROCEDURE SET_BOOLEAN_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER, P_STATE IN BOOLEAN);

  PROCEDURE GET_VALID_WINDOW_HANDLE(
    P_PROC_NAME IN VARCHAR2 DEFAULT 'STD_WINDOW.GET_VALID_WINDOW_HANDLE',
    P_WINDOW_NAME IN STD_TYPE.WINDOW_NAME,
    X_HANDLE OUT STD_TYPE.WINDOW_HANDLE
  );
  

  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_WINDOW_NAME IN STD_TYPE.WINDOW_NAME) RETURN STD_WINDOW
  IS
    L_WINDOW STD_WINDOW;
  BEGIN
    STD_TYPE.VALIDATE('STD_WINDOW.NEW', 'P_WINDOW_NAME', P_WINDOW_NAME, STD_TYPE.ARG_TYPE.WINDOW_NAME);
    
    IF P_WINDOW_NAME IS NOT NULL THEN
      GET_VALID_WINDOW_HANDLE('STD_WINDOW.NEW', P_WINDOW_NAME, L_WINDOW.HANDLE);

      L_WINDOW.NAME := UPPER(P_WINDOW_NAME);
    END IF;

    RETURN L_WINDOW;
  END NEW;


  FUNCTION NEW_FORMS_MDI_WINDOW RETURN STD_WINDOW
  IS
    L_WINDOW STD_WINDOW;
    L_WINDOW_HANDLE STD_TYPE.WINDOW_HANDLE;
  BEGIN
    -- HACK: The built-in constant FORMS_MDI_WINDOW is some kind of magic, but manually
    -- constructed window handle seems to work fine
    L_WINDOW_HANDLE.ID := -1;
    
    L_WINDOW.HANDLE := L_WINDOW_HANDLE;
    L_WINDOW.NAME := 'FORMS_MDI_WINDOW';

    RETURN L_WINDOW;
  END NEW_FORMS_MDI_WINDOW;

  
  FUNCTION IS_NULL(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_WINDOW.NAME = '_NULL_WINDOW_'
      OR ID_NULL(P_WINDOW.HANDLE);
  END IS_NULL;


  FUNCTION EQUALS(P_WINDOW_1 IN STD_WINDOW, P_WINDOW_2 IN STD_WINDOW) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_WINDOW_1.NAME = P_WINDOW_2.NAME;
  END EQUALS;


  PROCEDURE SHOW(P_WINDOW IN STD_WINDOW)
  IS
  BEGIN
    SHOW_WINDOW(P_WINDOW.HANDLE);
  END SHOW;


  PROCEDURE HIDE(P_WINDOW IN STD_WINDOW)
  IS
  BEGIN
    HIDE_WINDOW(P_WINDOW.HANDLE);
  END HIDE;


  FUNCTION BACKGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_BACKGROUND_COLOR(P_WINDOW);
  END BACKGROUND_COLOR;


  FUNCTION GET_BACKGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.BACKGROUND_COLOR);
  END GET_BACKGROUND_COLOR;


  PROCEDURE SET_BACKGROUND_COLOR(P_WINDOW IN STD_WINDOW, P_BACKGROUND_COLOR IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.BACKGROUND_COLOR, P_BACKGROUND_COLOR);
  END SET_BACKGROUND_COLOR;


  FUNCTION DIRECTION(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_DIRECTION(P_WINDOW);
  END DIRECTION;


  FUNCTION GET_DIRECTION(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.DIRECTION);
  END GET_DIRECTION;


  PROCEDURE SET_DIRECTION(P_WINDOW IN STD_WINDOW, P_DIRECTION IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.DIRECTION, P_DIRECTION);
  END SET_DIRECTION;


  FUNCTION FILL_PATTERN(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_FILL_PATTERN(P_WINDOW);
  END FILL_PATTERN;


  FUNCTION GET_FILL_PATTERN(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FILL_PATTERN);
  END GET_FILL_PATTERN;


  PROCEDURE SET_FILL_PATTERN(P_WINDOW IN STD_WINDOW, P_PATTERN_NAME IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FILL_PATTERN, P_PATTERN_NAME);
  END SET_FILL_PATTERN;


  FUNCTION FONT_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_FONT_NAME(P_WINDOW);
  END FONT_NAME;


  FUNCTION GET_FONT_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_NAME);
  END GET_FONT_NAME;


  PROCEDURE SET_FONT_NAME(P_WINDOW IN STD_WINDOW, P_FONT_NAME IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_NAME, P_FONT_NAME);
  END SET_FONT_NAME;


  FUNCTION FONT_SIZE(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_FONT_SIZE(P_WINDOW);
  END FONT_SIZE;


  FUNCTION GET_FONT_SIZE(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_SIZE);
  END GET_FONT_SIZE;


  PROCEDURE SET_FONT_SIZE(P_WINDOW IN STD_WINDOW, P_SIZE IN NUMBER)
  IS
  BEGIN
     SET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_SIZE, P_SIZE);
  END SET_FONT_SIZE;


  FUNCTION FONT_SPACING(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_FONT_SPACING(P_WINDOW);
  END FONT_SPACING;


  FUNCTION GET_FONT_SPACING(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_SPACING);
  END GET_FONT_SPACING;


  PROCEDURE SET_FONT_SPACING(P_WINDOW IN STD_WINDOW, P_SPACING IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_SPACING, P_SPACING);
  END SET_FONT_SPACING;


  FUNCTION FONT_STYLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_FONT_STYLE(P_WINDOW);
  END FONT_STYLE;


  FUNCTION GET_FONT_STYLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_STYLE);
  END GET_FONT_STYLE;


  PROCEDURE SET_FONT_STYLE(P_WINDOW IN STD_WINDOW, P_STYLE IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_STYLE, P_STYLE);
  END SET_FONT_STYLE;


  FUNCTION FONT_WEIGHT(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_FONT_WEIGHT(P_WINDOW);
  END FONT_WEIGHT;


  FUNCTION GET_FONT_WEIGHT(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_WEIGHT);
  END GET_FONT_WEIGHT;


  PROCEDURE SET_FONT_WEIGHT(P_WINDOW IN STD_WINDOW, P_WEIGHT IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FONT_WEIGHT, P_WEIGHT);
  END SET_FONT_WEIGHT;


  FUNCTION FOREGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_FOREGROUND_COLOR(P_WINDOW);
  END FOREGROUND_COLOR;


  FUNCTION GET_FOREGROUND_COLOR(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FOREGROUND_COLOR);
  END GET_FOREGROUND_COLOR;


  PROCEDURE SET_FOREGROUND_COLOR(P_WINDOW IN STD_WINDOW, P_COLOR IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.FOREGROUND_COLOR, P_COLOR);
  END SET_FOREGROUND_COLOR;


  FUNCTION HEIGHT(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_HEIGHT(P_WINDOW);
  END HEIGHT;


  FUNCTION GET_HEIGHT(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.HEIGHT);
  END GET_HEIGHT;


  PROCEDURE SET_HEIGHT(P_WINDOW IN STD_WINDOW, P_HEIGHT IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.HEIGHT, P_HEIGHT);
  END SET_HEIGHT;


  FUNCTION HIDE_ON_EXIT(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_HIDE_ON_EXIT(P_WINDOW);
  END HIDE_ON_EXIT;


  FUNCTION GET_HIDE_ON_EXIT(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.HIDE_ON_EXIT);
  END GET_HIDE_ON_EXIT;


  PROCEDURE SET_HIDE_ON_EXIT(P_WINDOW IN STD_WINDOW, P_STATE IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.HIDE_ON_EXIT, P_STATE);
  END SET_HIDE_ON_EXIT;


  FUNCTION ICON_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_ICON_NAME(P_WINDOW);
  END ICON_NAME;


  FUNCTION GET_ICON_NAME(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.ICON_NAME);
  END GET_ICON_NAME;


  PROCEDURE SET_ICON_NAME(P_WINDOW IN STD_WINDOW, P_ICON_NAME IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.ICON_NAME, P_ICON_NAME);
  END SET_ICON_NAME;


  FUNCTION TITLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_TITLE(P_WINDOW);
  END TITLE;


  FUNCTION GET_TITLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.TITLE);
  END GET_TITLE;


  PROCEDURE SET_TITLE(P_WINDOW IN STD_WINDOW, P_TITLE IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.TITLE, P_TITLE);
  END SET_TITLE;


  FUNCTION VISIBLE(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_VISIBLE(P_WINDOW);
  END VISIBLE;


  FUNCTION GET_VISIBLE(P_WINDOW IN STD_WINDOW) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.VISIBLE);
  END GET_VISIBLE;

  
  PROCEDURE SET_VISIBLE(P_WINDOW IN STD_WINDOW, P_VISIBLE IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.VISIBLE, P_VISIBLE);
  END SET_VISIBLE;


  FUNCTION WIDTH(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_WIDTH(P_WINDOW);
  END WIDTH;


  FUNCTION GET_WIDTH(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.WIDTH);
  END GET_WIDTH;


  PROCEDURE SET_WIDTH(P_WINDOW IN STD_WINDOW, P_WIDTH IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.WIDTH, P_WIDTH);
  END SET_WIDTH;


  FUNCTION WINDOW_HANDLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_WINDOW_HANDLE(P_WINDOW);
  END WINDOW_HANDLE;


  FUNCTION GET_WINDOW_HANDLE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.WINDOW_HANDLE);
  END GET_WINDOW_HANDLE;


  FUNCTION WINDOW_STATE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_WINDOW_STATE(P_WINDOW);
  END WINDOW_STATE;


  FUNCTION GET_WINDOW_STATE(P_WINDOW IN STD_WINDOW) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.WINDOW_STATE);
  END GET_WINDOW_STATE;


  PROCEDURE SET_WINDOW_STATE(P_WINDOW IN STD_WINDOW, P_STATE IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.WINDOW_STATE, P_STATE);
  END SET_WINDOW_STATE;


  FUNCTION X_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_X_POS(P_WINDOW);
  END X_POS;


  FUNCTION GET_X_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.X_POS);
  END GET_X_POS;


  PROCEDURE SET_X_POS(P_WINDOW IN STD_WINDOW, P_X_POS IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.X_POS, P_X_POS);
  END SET_X_POS;


  FUNCTION Y_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_Y_POS(P_WINDOW);
  END Y_POS;


  FUNCTION GET_Y_POS(P_WINDOW IN STD_WINDOW) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.Y_POS);
  END GET_Y_POS;


  PROCEDURE SET_Y_POS(P_WINDOW IN STD_WINDOW, P_Y_POS IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_WINDOW, STD_WINDOW_PROPS.Y_POS, P_Y_POS);
  END SET_Y_POS;


  ------------------------------------------------------------------------------
  -- Private API
  ------------------------------------------------------------------------------
  
  FUNCTION GET_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_WINDOW_PROPERTY(P_WINDOW.HANDLE, P_PROPERTY);
  END GET_PROPERTY;
  
  
  PROCEDURE SET_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_WINDOW_PROPERTY(P_WINDOW.HANDLE, P_PROPERTY, P_VALUE);
  END SET_PROPERTY;
  

  FUNCTION GET_NUMBER_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_PROPERTY(P_WINDOW, P_PROPERTY));
  END GET_NUMBER_PROPERTY;
  

  PROCEDURE SET_NUMBER_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER)
  IS
  BEGIN
    SET_WINDOW_PROPERTY(P_WINDOW.HANDLE, P_PROPERTY, TO_NUMBER(P_VALUE));
  END SET_NUMBER_PROPERTY;


  FUNCTION GET_BOOLEAN_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_PROPERTY(P_WINDOW, P_PROPERTY) = 'TRUE';
  END GET_BOOLEAN_PROPERTY;


  PROCEDURE SET_BOOLEAN_PROPERTY(P_WINDOW IN STD_WINDOW, P_PROPERTY IN NUMBER, P_STATE IN BOOLEAN)
  IS
    L_STATE NUMBER;
  BEGIN
    IF P_STATE THEN
      L_STATE := PROPERTY_TRUE;
    ELSE
      L_STATE := PROPERTY_FALSE;
    END IF;

    SET_WINDOW_PROPERTY(P_WINDOW.HANDLE, P_PROPERTY, L_STATE);
  END SET_BOOLEAN_PROPERTY;


  PROCEDURE GET_VALID_WINDOW_HANDLE(
    P_PROC_NAME IN VARCHAR2 DEFAULT 'STD_WINDOW.GET_VALID_WINDOW_HANDLE',
    P_WINDOW_NAME IN STD_TYPE.WINDOW_NAME,
    X_HANDLE OUT STD_TYPE.WINDOW_HANDLE
  )
  IS
    L_HANDLE STD_TYPE.WINDOW_HANDLE;
  BEGIN
    L_HANDLE := FIND_WINDOW(P_WINDOW_NAME);
    
    IF ID_NULL(L_HANDLE) THEN
      FND_MESSAGE.SET_STRING(P_PROC_NAME || ': Unable to find window ''' || P_WINDOW_NAME || '''');
      APP_EXCEPTION.RAISE_EXCEPTION;
    END IF;

    X_HANDLE := L_HANDLE;
  END GET_VALID_WINDOW_HANDLE;
  

END STD_WINDOW;