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

  FUNCTION GET_NUMBER_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN NUMBER
  ) RETURN NUMBER;
  
  FUNCTION GET_NUMBER_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER,
    P_PROPERTY IN NUMBER
  ) RETURN NUMBER;

  PROCEDURE SET_NUMBER_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN NUMBER, 
    P_VALUE IN NUMBER
  );

  PROCEDURE SET_NUMBER_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER,
    P_PROPERTY IN NUMBER, 
    P_VALUE IN NUMBER
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

  FUNCTION IS_MULTIPART_SUPPORTED(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER DEFAULT 1
  ) RETURN BOOLEAN;

  PROCEDURE SET_MULTIPART_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, 
    P_RECORD_NUMBER IN NUMBER, 
    P_VALUE IN VARCHAR2
  );

  PROCEDURE SET_MULTIPART_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, 
    P_RECORD_NUMBER IN NUMBER, 
    P_VALUE IN OUT NOCOPY CLOB
  );

  FUNCTION IS_VALUE_MULTIPART_CANDIDATE(P_VALUE IN OUT NOCOPY CLOB) RETURN BOOLEAN;
  
  FUNCTION IS_VALUE_MULTIPART_CANDIDATE(P_VALUE IN VARCHAR2) RETURN BOOLEAN;


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

  
  FUNCTION IS_VALUE_NULL(P_ITEM IN STD_ITEM) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_VALUE(P_ITEM) IS NULL;
  END IS_VALUE_NULL;


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


  FUNCTION DATE_VALUE(P_ITEM IN STD_ITEM) RETURN DATE
  IS
  BEGIN
    RETURN GET_DATE_VALUE(P_ITEM);
  END DATE_VALUE;


  FUNCTION GET_DATE_VALUE(P_ITEM IN STD_ITEM) RETURN DATE
  IS 
  BEGIN
    RETURN APP_DATE.FIELD_TO_DATE(P_ITEM.NAME);
  END GET_DATE_VALUE;


  PROCEDURE SET_DATE_VALUE(P_ITEM IN STD_ITEM, P_VALUE IN DATE)
  IS
  BEGIN
    APP_DATE.DATE_TO_FIELD(P_VALUE, P_ITEM.NAME);
  END SET_DATE_VALUE;


  PROCEDURE COPY_VALUE(P_ITEM IN STD_ITEM, P_COPY_FROM_ITEM IN STD_ITEM)
  IS
  BEGIN
    SET_VALUE(P_ITEM, VALUE(P_COPY_FROM_ITEM));
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


  FUNCTION HEIGHT(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_HEIGHT(P_ITEM);
  END HEIGHT;


  FUNCTION GET_HEIGHT(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_PROPERTY(P_ITEM, STD_ITEM_PROPS.HEIGHT));
  END GET_HEIGHT;
  

  PROCEDURE SET_HEIGHT(P_ITEM IN STD_ITEM, P_HEIGHT IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_ITEM, STD_ITEM_PROPS.HEIGHT, P_HEIGHT);
  END SET_HEIGHT;
  
  
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

  
  FUNCTION UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_UPDATE_ALLOWED(P_ITEM, P_RECORD_NUMBER);
  END UPDATE_ALLOWED;


  FUNCTION GET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_ITEM, P_RECORD_NUMBER, STD_ITEM_PROPS.UPDATE_ALLOWED);
  END GET_UPDATE_ALLOWED;

  
  PROCEDURE SET_UPDATE_ALLOWED(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_STATE IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_ITEM, P_RECORD_NUMBER, STD_ITEM_PROPS.UPDATE_ALLOWED, P_STATE);
  END SET_UPDATE_ALLOWED;

  
  FUNCTION VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_VATTR
  IS
  BEGIN
    RETURN GET_VISUAL_ATTRIBUTE(P_ITEM);
  END VISUAL_ATTRIBUTE;


  FUNCTION GET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM) RETURN STD_STRUCTURE.STD_VATTR
  IS
  BEGIN
    RETURN STD_VATTR.NEW(GET_PROPERTY(P_ITEM, STD_ITEM_PROPS.VISUAL_ATTRIBUTE));
  END GET_VISUAL_ATTRIBUTE;
  

  PROCEDURE SET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_VISUAL_ATTRIBUTE IN STD_STRUCTURE.STD_VATTR)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, STD_ITEM_PROPS.VISUAL_ATTRIBUTE, P_VISUAL_ATTRIBUTE.NAME);
  END SET_VISUAL_ATTRIBUTE;


  FUNCTION VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN STD_STRUCTURE.STD_VATTR
  IS
  BEGIN
    RETURN GET_VISUAL_ATTRIBUTE(P_ITEM, P_RECORD_NUMBER);
  END VISUAL_ATTRIBUTE;


  FUNCTION GET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER) RETURN STD_STRUCTURE.STD_VATTR
  IS
  BEGIN
    RETURN STD_VATTR.NEW(GET_PROPERTY(P_ITEM, P_RECORD_NUMBER, STD_ITEM_PROPS.VISUAL_ATTRIBUTE));
  END GET_VISUAL_ATTRIBUTE;

  
  PROCEDURE SET_VISUAL_ATTRIBUTE(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_VISUAL_ATTRIBUTE IN STD_STRUCTURE.STD_VATTR)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_RECORD_NUMBER, STD_ITEM_PROPS.VISUAL_ATTRIBUTE, P_VISUAL_ATTRIBUTE.NAME);
  END SET_VISUAL_ATTRIBUTE;


  FUNCTION WIDTH(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_WIDTH(P_ITEM);
  END WIDTH;


  FUNCTION GET_WIDTH(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_PROPERTY(P_ITEM, STD_ITEM_PROPS.WIDTH));
  END GET_WIDTH;
  

  PROCEDURE SET_WIDTH(P_ITEM IN STD_ITEM, P_WIDTH IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_ITEM, STD_ITEM_PROPS.WIDTH, P_WIDTH);
  END SET_WIDTH;


  FUNCTION X_POS(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_X_POS(P_ITEM);
  END X_POS;


  FUNCTION GET_X_POS(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_PROPERTY(P_ITEM, STD_ITEM_PROPS.X_POS));
  END GET_X_POS;
  

  PROCEDURE SET_X_POS(P_ITEM IN STD_ITEM, P_X_POS IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_ITEM, STD_ITEM_PROPS.X_POS, P_X_POS);
  END SET_X_POS;


  FUNCTION Y_POS(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_Y_POS(P_ITEM);
  END Y_POS;


  FUNCTION GET_Y_POS(P_ITEM IN STD_ITEM) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_PROPERTY(P_ITEM, STD_ITEM_PROPS.Y_POS));
  END GET_Y_POS;
  

  PROCEDURE SET_Y_POS(P_ITEM IN STD_ITEM, P_Y_POS IN NUMBER)
  IS
  BEGIN
    SET_NUMBER_PROPERTY(P_ITEM, STD_ITEM_PROPS.Y_POS, P_Y_POS);
  END SET_Y_POS;


  ------------------------------------------------------------------------------
  -- Custom properties handling
  ------------------------------------------------------------------------------

  -- Alias for GET_PROPERTY
  FUNCTION CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER DEFAULT 1) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER);
  END CUSTOM_PROPERTY;

  -- Alias for GET_PROPERTY
  FUNCTION GET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER DEFAULT 1) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER);
  END GET_CUSTOM_PROPERTY;

  
  FUNCTION GET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER DEFAULT 1) RETURN VARCHAR2
  IS
    L_RESULT STD_TYPE.MAX_VARCHAR2_PLSQL;
  BEGIN
    L_RESULT := STD_ITEM_PRIVATE.GET_CUSTOM_PROPERTY_PROXY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER);
    
    IF L_RESULT = '$$UNEXPECTED_ERROR$$' THEN
      APP_EXCEPTION.RAISE_EXCEPTION('APP', 780, 'Unexpected error inside component during getting property ''' || P_PROPERTY.NAME || '''');
    END IF;

    RETURN L_RESULT;
  END GET_PROPERTY;
  
  -- Alias for SET_PROPERTY (VARCHAR2)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_VALUE);
  END SET_CUSTOM_PROPERTY;
  
  -- Alias for SET_PROPERTY (CLOB)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN OUT NOCOPY CLOB)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_VALUE);
  END SET_CUSTOM_PROPERTY;
  
  -- Alias for SET_PROPERTY (NUMBER)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_NUMBER_VALUE IN NUMBER)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_NUMBER_VALUE);
  END SET_CUSTOM_PROPERTY;
  
  -- Alias for SET_PROPERTY (BOOLEAN)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_BOOLEAN_VALUE IN BOOLEAN)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_BOOLEAN_VALUE);
  END SET_CUSTOM_PROPERTY;
  
  -- Alias for SET_PROPERTY ALL_ROWS (VARCHAR2)
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, STD_RECORD_GROUP_PROPS.ALL_ROWS, P_VALUE);
  END SET_PROPERTY;
  
  -- Alias for SET_PROPERTY ALL_ROWS (CLOB)
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_VALUE IN OUT NOCOPY CLOB)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, STD_RECORD_GROUP_PROPS.ALL_ROWS, P_VALUE);
  END SET_PROPERTY;
  
  -- Alias for SET_PROPERTY ALL_ROWS (NUMBER)
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_NUMBER_VALUE IN NUMBER)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, STD_RECORD_GROUP_PROPS.ALL_ROWS, P_NUMBER_VALUE);
  END SET_PROPERTY;
  
  -- Alias for SET_PROPERTY ALL_ROWS (BOOLEAN)
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_BOOLEAN_VALUE IN BOOLEAN)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, STD_RECORD_GROUP_PROPS.ALL_ROWS, P_BOOLEAN_VALUE);
  END SET_PROPERTY;
  
  -- Alias for SET_PROPERTY specific record (VARCHAR2)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_VALUE);
  END SET_CUSTOM_PROPERTY;

  -- Alias for SET_PROPERTY specific record (CLOB)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN OUT NOCOPY CLOB)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_VALUE);
  END SET_CUSTOM_PROPERTY;

  -- Alias for SET_PROPERTY specific record (NUMBER)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_NUMBER_VALUE IN NUMBER)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_NUMBER_VALUE);
  END SET_CUSTOM_PROPERTY;

  -- Alias for SET_PROPERTY specific record (BOOLEAN)
  PROCEDURE SET_CUSTOM_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_BOOLEAN_VALUE IN BOOLEAN)
  IS
  BEGIN
    SET_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_BOOLEAN_VALUE);
  END SET_CUSTOM_PROPERTY;

  
  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN VARCHAR2)
  IS
  BEGIN  
    IF IS_VALUE_MULTIPART_CANDIDATE(P_VALUE) THEN
        IF IS_MULTIPART_SUPPORTED(P_ITEM) THEN
          SET_MULTIPART_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_VALUE);
        ELSE
          APP_EXCEPTION.RAISE_EXCEPTION('APP', 770, 'Value for property ''' || P_PROPERTY.NAME || ''' is too big  (' || LENGTH(P_VALUE) || ' chars) and multipart values are not supported by this component');
        END IF;
    ELSE
      STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_VALUE);
    END IF;
  END SET_PROPERTY;


  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN OUT NOCOPY CLOB)
  IS
  BEGIN  
    IF IS_VALUE_MULTIPART_CANDIDATE(P_VALUE) THEN
        IF IS_MULTIPART_SUPPORTED(P_ITEM) THEN
          SET_MULTIPART_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_VALUE);
        ELSE
          APP_EXCEPTION.RAISE_EXCEPTION('APP', 770, 'Value for property ''' || P_PROPERTY.NAME || ''' is too big  (' || DBMS_LOB.GETLENGTH(P_VALUE) || ' chars) and multipart values are not supported by this component');
        END IF;
    ELSE
      STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_VALUE);
    END IF;
  END SET_PROPERTY;


  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_NUMBER_VALUE IN NUMBER)
  IS
  BEGIN
    STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_NUMBER_VALUE);
  END SET_PROPERTY;


  PROCEDURE SET_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_BOOLEAN_VALUE IN BOOLEAN)
  IS
  BEGIN
    STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, P_BOOLEAN_VALUE);
  END SET_PROPERTY;  


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

  FUNCTION GET_NUMBER_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN NUMBER) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_ITEM_PROPERTY(P_ITEM.HANDLE, P_PROPERTY));
  END GET_NUMBER_PROPERTY;


  FUNCTION GET_NUMBER_PROPERTY(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_ITEM_INSTANCE_PROPERTY(P_ITEM.HANDLE, P_RECORD_NUMBER, P_PROPERTY));
  END GET_NUMBER_PROPERTY;
  
  
  PROCEDURE SET_NUMBER_PROPERTY(P_ITEM IN STD_ITEM, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER)
  IS
  BEGIN
    SET_ITEM_PROPERTY(P_ITEM.HANDLE, P_PROPERTY, P_VALUE);
  END SET_NUMBER_PROPERTY;
  
  
  PROCEDURE SET_NUMBER_PROPERTY(P_ITEM IN STD_ITEM, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER)
  IS
  BEGIN
    SET_ITEM_INSTANCE_PROPERTY(P_ITEM.HANDLE, P_RECORD_NUMBER, P_PROPERTY, P_VALUE);
  END SET_NUMBER_PROPERTY;


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
      APP_EXCEPTION.RAISE_EXCEPTION('APP', 750, fnd_message.get());
    END IF;

    X_HANDLE := L_HANDLE;
  END GET_VALID_ITEM_HANDLE;


  FUNCTION IS_MULTIPART_SUPPORTED(
    P_ITEM IN STD_ITEM, 
    P_RECORD_NUMBER IN NUMBER DEFAULT 1
  ) RETURN BOOLEAN
  IS
  BEGIN
    RETURN STD_CONVERT.TO_BOOLEAN(STD_ITEM_PRIVATE.GET_CUSTOM_PROPERTY_PROXY(P_ITEM, STD_ITEM_CUSTOM_PROPS.MULTIPART_SUPPORTED, P_RECORD_NUMBER));
  -- EXCEPTION
  --   WHEN OTHERS THEN
  --     RETURN FALSE;
  END IS_MULTIPART_SUPPORTED;


  PROCEDURE SET_MULTIPART_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, 
    P_RECORD_NUMBER IN NUMBER, 
    P_VALUE IN VARCHAR2
  )
  IS
    LC_CLOB_VALUE CLOB := P_VALUE;
  BEGIN  
    SET_MULTIPART_PROPERTY(P_ITEM, P_PROPERTY, P_RECORD_NUMBER, LC_CLOB_VALUE);
  END SET_MULTIPART_PROPERTY;


  PROCEDURE SET_MULTIPART_PROPERTY(
    P_ITEM IN STD_ITEM, 
    P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, 
    P_RECORD_NUMBER IN NUMBER, 
    P_VALUE IN OUT NOCOPY CLOB
  )
  IS
    L_CHUNKS STD_TYPE.CLOB_CHUNKS;
  BEGIN  
    L_CHUNKS := STD_CONVERT.CLOB_TO_CLOB_CHUNKS(P_VALUE, STD_CONSTRAINTS.MAX_PROPERTY_VALUE_LENGTH);
    STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, STD_ITEM_CUSTOM_PROPS.MULTIPART_RESET, P_RECORD_NUMBER, true);

    FOR I IN 1 .. L_CHUNKS.COUNT LOOP
        STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, STD_ITEM_CUSTOM_PROPS.MULTIPART_NEXT_CHUNK, P_RECORD_NUMBER, L_CHUNKS(I));
    END LOOP;

    STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, STD_ITEM_CUSTOM_PROPS.MULTIPART_DESTINATION, P_RECORD_NUMBER, P_PROPERTY.NAME);
    STD_ITEM_PRIVATE.SET_CUSTOM_PROPERTY_PROXY(P_ITEM, STD_ITEM_CUSTOM_PROPS.MULTIPART_EOT, P_RECORD_NUMBER, true);
  END SET_MULTIPART_PROPERTY;
  
  
  FUNCTION IS_VALUE_MULTIPART_CANDIDATE(P_VALUE IN OUT NOCOPY CLOB) RETURN BOOLEAN
  IS
  BEGIN
    STD_TYPE.VALIDATE('STD_ITEM.IS_VALUE_MULTIPART_CANDIDATE', 'P_VALUE', P_VALUE, STD_TYPE.ARG_TYPE.PROPERTY_VALUE);
    RETURN FALSE;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN TRUE;
  END IS_VALUE_MULTIPART_CANDIDATE;
  
  
  FUNCTION IS_VALUE_MULTIPART_CANDIDATE(P_VALUE IN VARCHAR2) RETURN BOOLEAN
  IS
  BEGIN
    STD_TYPE.VALIDATE('STD_ITEM.IS_VALUE_MULTIPART_CANDIDATE', 'P_VALUE', P_VALUE, STD_TYPE.ARG_TYPE.PROPERTY_VALUE);
    RETURN FALSE;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN TRUE;
  END IS_VALUE_MULTIPART_CANDIDATE;
  

END STD_ITEM;