CREATE OR REPLACE PACKAGE BODY STD_ITEM IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Private API declarations
  ------------------------------------------------------------------------------

  FUNCTION GET_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN NUMBER
  ) RETURN VARCHAR2;
  
  FUNCTION GET_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER,
    P_PROPERTY IN NUMBER
  ) RETURN VARCHAR2;

  PROCEDURE SET_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN NUMBER, 
    P_VALUE IN VARCHAR2
  );

  PROCEDURE SET_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER,
    P_PROPERTY IN NUMBER, 
    P_VALUE IN VARCHAR2
  );
  
  FUNCTION GET_BOOLEAN_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN NUMBER
  ) RETURN BOOLEAN;
  
  FUNCTION GET_BOOLEAN_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER,
    P_PROPERTY IN NUMBER
  ) RETURN BOOLEAN;

  PROCEDURE SET_BOOLEAN_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN NUMBER, 
    P_STATE IN BOOLEAN
  );

  PROCEDURE SET_BOOLEAN_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER,
    P_PROPERTY IN NUMBER, 
    P_STATE IN BOOLEAN
  );

  PROCEDURE GET_VALID_ITEM_HANDLE(
    P_PROC_NAME IN VARCHAR2 DEFAULT 'STD_ITEM.GET_VALID_ITEM_HANDLE',
    P_FULL_ITEM_NAME IN STD_TYPE.FULL_ITEM_NAME,
    X_HANDLE OUT STD_TYPE.ITEM_HANDLE
  );


  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------
  
  FUNCTION NEW(P_FULL_ITEM_NAME IN STD_TYPE.FULL_ITEM_NAME) RETURN STD_ITEM
  IS
    L_ITEM STD_ITEM;
  BEGIN
    STD_TYPE.VALIDATE('STD_ITEM.NEW', 'P_FULL_ITEM_NAME', P_FULL_ITEM_NAME, STD_TYPE.ARG_TYPE.FULL_ITEM_NAME);
    
    GET_VALID_ITEM_HANDLE('STD_ITEM.NEW', P_FULL_ITEM_NAME, L_ITEM.HANDLE);

    L_ITEM.FULL_NAME := UPPER(P_FULL_ITEM_NAME);
    L_ITEM.NAME := UPPER(GET_PROPERTY(L_ITEM, STD_ITEM_PROPS.ITEM_NAME));
    L_ITEM.BLOCK := STD_BLOCK.NEW(GET_PROPERTY(L_ITEM, STD_ITEM_PROPS.BLOCK_NAME));

    RETURN L_ITEM;
  END NEW;

  
  FUNCTION IS_NULL(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_ITEM.NAME = '_NULL_ITEM_'
      OR ID_NULL(P_ITEM.HANDLE);
  END IS_NULL;


  FUNCTION EQUALS(P_ITEM_1 IN STD_ITEM, P_ITEM_2 IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN
      -- NOT IS_NULL(P_ITEM_1)
      -- AND NOT IS_NULL(P_ITEM_2)
      -- AND 
      P_ITEM_1.NAME = P_ITEM_2.NAME
      AND P_ITEM_1.FULL_NAME = P_ITEM_2.FULL_NAME
      AND STD_BLOCK.EQUALS(P_ITEM_1.BLOCK, P_ITEM_2.BLOCK);
  END EQUALS;


  FUNCTION IS_IN(
    P_ITEM IN STD_ITEM, 
    P_TEST_ITEM_1 IN STD_ITEM, 
    P_TEST_ITEM_2 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_3 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_4 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_5 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_6 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_7 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_8 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_9 IN STD_ITEM DEFAULT NULL, 
    P_TEST_ITEM_10 IN STD_ITEM DEFAULT NULL
  ) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_ITEM.NAME IN (
      P_TEST_ITEM_1.NAME,
      P_TEST_ITEM_2.NAME,
      P_TEST_ITEM_3.NAME,
      P_TEST_ITEM_4.NAME,
      P_TEST_ITEM_5.NAME,
      P_TEST_ITEM_6.NAME,
      P_TEST_ITEM_7.NAME,
      P_TEST_ITEM_8.NAME,
      P_TEST_ITEM_9.NAME,
      P_TEST_ITEM_10.NAME
    )
    AND P_ITEM.FULL_NAME IN (
      P_TEST_ITEM_1.FULL_NAME,
      P_TEST_ITEM_2.FULL_NAME,
      P_TEST_ITEM_3.FULL_NAME,
      P_TEST_ITEM_4.FULL_NAME,
      P_TEST_ITEM_5.FULL_NAME,
      P_TEST_ITEM_6.FULL_NAME,
      P_TEST_ITEM_7.FULL_NAME,
      P_TEST_ITEM_8.FULL_NAME,
      P_TEST_ITEM_9.FULL_NAME,
      P_TEST_ITEM_10.FULL_NAME
    );
  END IS_IN;


  FUNCTION VALUE(P_ITEM IN STD_ITEM) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_VALUE(P_ITEM);
  END VALUE;


  FUNCTION GET_VALUE(P_ITEM IN STD_ITEM) RETURN VARCHAR2
  IS
  BEGIN
    RETURN NAME_IN(P_ITEM.FULL_NAME);
  END GET_VALUE;


  PROCEDURE SET_VALUE(P_ITEM IN STD_ITEM, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    COPY(P_VALUE, P_ITEM.FULL_NAME);
  END SET_VALUE;


  FUNCTION NUMBER_VALUE(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_NUMBER_VALUE(P_ITEM);
  END NUMBER_VALUE;


  FUNCTION GET_NUMBER_VALUE(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS 
  BEGIN
    RETURN TO_NUMBER(GET_VALUE(P_ITEM));
  END GET_NUMBER_VALUE;


  PROCEDURE SET_NUMBER_VALUE(P_ITEM IN STD_ITEM, P_VALUE IN NUMBER)
  IS
  BEGIN
    SET_VALUE(P_ITEM, TO_CHAR(P_VALUE));
  END SET_NUMBER_VALUE;


  PROCEDURE COPY_VALUE(P_COPY_FROM_ITEM IN STD_ITEM, P_COPY_TO_ITEM IN STD_ITEM)
  IS
  BEGIN
    SET_VALUE(P_COPY_TO_ITEM, VALUE(P_COPY_FROM_ITEM));
  END COPY_VALUE;


  PROCEDURE FOCUS(P_ITEM IN STD_ITEM)
  IS
  BEGIN
    GO_ITEM(P_ITEM.HANDLE);
  END FOCUS;


  PROCEDURE GO(P_ITEM IN STD_ITEM)
  IS
  BEGIN
    FOCUS(P_ITEM);
  END GO;


  FUNCTION ENABLED(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_ENABLED(P_ITEM);
  END ENABLED;


  FUNCTION GET_ENABLED(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_ITEM, STD_ITEM_PROPS.ENABLED);
  END GET_ENABLED;

  
  PROCEDURE SET_ENABLED(P_ITEM IN STD_ITEM, P_ENABLED IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_ITEM, STD_ITEM_PROPS.ENABLED, P_ENABLED);
  END SET_ENABLED;
  
  
  FUNCTION CANVAS(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_CANVAS
  IS
  BEGIN
    RETURN GET_CANVAS(P_ITEM);
  END CANVAS;


  FUNCTION GET_CANVAS(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_CANVAS
  IS
  BEGIN
    RETURN STD_CANVAS.NEW(GET_PROPERTY(P_ITEM, STD_ITEM_PROPS.ITEM_CANVAS));
  END GET_CANVAS;

  
  FUNCTION INSERT_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_INSERT_ALLOWED(P_ITEM);
  END INSERT_ALLOWED;


  FUNCTION GET_INSERT_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_ITEM, STD_ITEM_PROPS.INSERT_ALLOWED);
  END GET_INSERT_ALLOWED;

  
  PROCEDURE SET_INSERT_ALLOWED(P_ITEM IN STD_ITEM, P_STATE IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_ITEM, STD_ITEM_PROPS.INSERT_ALLOWED, P_STATE);
  END SET_INSERT_ALLOWED;

  
  FUNCTION NAME(P_ITEM IN STD_ITEM) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_NAME(P_ITEM);
  END NAME;


  FUNCTION GET_NAME(P_ITEM IN STD_ITEM) RETURN VARCHAR2
  IS
  BEGIN
    RETURN P_ITEM.NAME;
  END GET_NAME;

  
  FUNCTION TAB_PAGE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_TAB_PAGE
  IS
  BEGIN
    RETURN GET_TAB_PAGE(P_ITEM);
  END TAB_PAGE;


  FUNCTION GET_TAB_PAGE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_TAB_PAGE
  IS
  BEGIN
    RETURN STD_TAB_PAGE.NEW(GET_PROPERTY(P_ITEM, STD_ITEM_PROPS.ITEM_TAB_PAGE));
  END GET_TAB_PAGE;

  
  FUNCTION UPDATE_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_UPDATE_ALLOWED(P_ITEM);
  END UPDATE_ALLOWED;


  FUNCTION GET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_ITEM, STD_ITEM_PROPS.UPDATE_ALLOWED);
  END GET_UPDATE_ALLOWED;

  
  PROCEDURE SET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_STATE IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_ITEM, STD_ITEM_PROPS.UPDATE_ALLOWED, P_STATE);
  END SET_UPDATE_ALLOWED;


  ------------------------------------------------------------------------------
  -- Private API
  ------------------------------------------------------------------------------

  FUNCTION GET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN NUMBER) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_ITEM_PROPERTY(P_ITEM.HANDLE, P_PROPERTY);
  END GET_PROPERTY;


  FUNCTION GET_PROPERTY(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_ITEM_INSTANCE_PROPERTY(P_ITEM.HANDLE, P_RECORD_NUMBER, P_PROPERTY);
  END GET_PROPERTY;
  
  
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_ITEM_PROPERTY(P_ITEM.HANDLE, P_PROPERTY, P_VALUE);
  END SET_PROPERTY;
  
  
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_ITEM_INSTANCE_PROPERTY(P_ITEM.HANDLE, P_RECORD_NUMBER, P_PROPERTY, P_VALUE);
  END SET_PROPERTY;


  FUNCTION GET_BOOLEAN_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN NUMBER) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_PROPERTY(P_ITEM, P_PROPERTY) = 'TRUE';
  END GET_BOOLEAN_PROPERTY;


  FUNCTION GET_BOOLEAN_PROPERTY(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_PROPERTY(P_ITEM, P_RECORD_NUMBER, P_PROPERTY) = 'TRUE';
  END GET_BOOLEAN_PROPERTY;


  PROCEDURE SET_BOOLEAN_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN NUMBER, P_STATE IN BOOLEAN)
  IS
    L_STATE NUMBER;
  BEGIN
    IF P_STATE THEN
      L_STATE := PROPERTY_TRUE;
    ELSE
      L_STATE := PROPERTY_FALSE;
    END IF;

    SET_ITEM_PROPERTY(P_ITEM.HANDLE, P_PROPERTY, L_STATE);
  END SET_BOOLEAN_PROPERTY;


  PROCEDURE SET_BOOLEAN_PROPERTY(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER, P_STATE IN BOOLEAN)
  IS
    L_STATE NUMBER;
  BEGIN
    IF P_STATE THEN
      L_STATE := PROPERTY_TRUE;
    ELSE
      L_STATE := PROPERTY_FALSE;
    END IF;

    SET_ITEM_INSTANCE_PROPERTY(P_ITEM.HANDLE, P_RECORD_NUMBER, P_PROPERTY, L_STATE);
  END SET_BOOLEAN_PROPERTY;


  PROCEDURE GET_VALID_ITEM_HANDLE(
    P_PROC_NAME IN VARCHAR2 DEFAULT 'STD_ITEM.GET_VALID_ITEM_HANDLE',
    P_FULL_ITEM_NAME IN STD_TYPE.FULL_ITEM_NAME,
    X_HANDLE OUT STD_TYPE.ITEM_HANDLE
  )
  IS
    L_HANDLE STD_TYPE.ITEM_HANDLE;
  BEGIN
    L_HANDLE := FIND_ITEM(P_FULL_ITEM_NAME);
    
    IF ID_NULL(L_HANDLE) THEN
      FND_MESSAGE.SET_STRING(P_PROC_NAME || ': Unable to find item ''' || P_FULL_ITEM_NAME || '''');
      APP_EXCEPTION.RAISE_EXCEPTION;
    END IF;

    X_HANDLE := L_HANDLE;
  END GET_VALID_ITEM_HANDLE;
  

END STD_ITEM;