CREATE OR REPLACE PACKAGE BODY STD_BLOCK IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Private API declarations
  ------------------------------------------------------------------------------

  FUNCTION GET_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER) RETURN VARCHAR2;

  PROCEDURE SET_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2);

  FUNCTION GET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER) RETURN NUMBER;

  PROCEDURE SET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER);
  
  FUNCTION GET_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER) RETURN VARCHAR2;

  PROCEDURE SET_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2);

  FUNCTION GET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER) RETURN NUMBER;

  PROCEDURE SET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER);

  PROCEDURE GET_VALID_BLOCK_HANDLE(
    P_PROC_NAME IN VARCHAR2 DEFAULT 'STD_BLOCK.GET_VALID_BLOCK_HANDLE',
    P_BLOCK_NAME IN STD_TYPE.BLOCK_NAME,
    X_HANDLE OUT STD_TYPE.BLOCK_HANDLE
  );

  FUNCTION GET_BOOLEAN_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER) RETURN BOOLEAN;
  
  PROCEDURE SET_BOOLEAN_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER, P_STATE IN BOOLEAN);
  

  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_BLOCK_NAME IN STD_TYPE.BLOCK_NAME) RETURN STD_BLOCK
  IS
    L_BLOCK STD_BLOCK;
  BEGIN
    STD_TYPE.VALIDATE('STD_BLOCK.NEW', 'P_BLOCK_NAME', P_BLOCK_NAME, STD_TYPE.ARG_TYPE.BLOCK_NAME);
    
    GET_VALID_BLOCK_HANDLE('STD_BLOCK.NEW', P_BLOCK_NAME, L_BLOCK.HANDLE);

    L_BLOCK.NAME := UPPER(P_BLOCK_NAME);

    RETURN L_BLOCK;
  END NEW;

  
  FUNCTION IS_NULL(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_BLOCK.NAME = '_NULL_BLOCK_'
      OR ID_NULL(P_BLOCK.HANDLE);
  END IS_NULL;


  FUNCTION EQUALS(P_BLOCK_1 IN STD_BLOCK, P_BLOCK_2 IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN
      -- NOT IS_NULL(P_BLOCK_1)
      -- AND NOT IS_NULL(P_BLOCK_2)
      -- AND 
      P_BLOCK_1.NAME = P_BLOCK_2.NAME;
  END EQUALS;


  FUNCTION IS_IN(
    P_BLOCK IN STD_BLOCK, 
    P_TEST_BLOCK_1 IN STD_BLOCK, 
    P_TEST_BLOCK_2 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_3 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_4 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_5 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_6 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_7 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_8 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_9 IN STD_BLOCK DEFAULT NULL, 
    P_TEST_BLOCK_10 IN STD_BLOCK DEFAULT NULL
  ) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_BLOCK.NAME IN (
      P_TEST_BLOCK_1.NAME,
      P_TEST_BLOCK_2.NAME,
      P_TEST_BLOCK_3.NAME,
      P_TEST_BLOCK_4.NAME,
      P_TEST_BLOCK_5.NAME,
      P_TEST_BLOCK_6.NAME,
      P_TEST_BLOCK_7.NAME,
      P_TEST_BLOCK_8.NAME,
      P_TEST_BLOCK_9.NAME,
      P_TEST_BLOCK_10.NAME
    );
  END IS_IN;


  PROCEDURE FOCUS(P_BLOCK IN STD_BLOCK)
  IS
  BEGIN
    GO_BLOCK(P_BLOCK.NAME);
  END FOCUS;


  PROCEDURE GO(P_BLOCK IN STD_BLOCK)
  IS
  BEGIN
    FOCUS(P_BLOCK);
  END GO;


  PROCEDURE QUERY(P_BLOCK IN STD_BLOCK)
  IS
    L_INITIAL_FOCUSED_ITEM STD_STRUCTURE.STD_ITEM;
    L_CURRENT_ITEM STD_STRUCTURE.STD_ITEM;
  BEGIN
    L_INITIAL_FOCUSED_ITEM := STD_ITEM.NEW(NAME_IN('SYSTEM.CURSOR_ITEM'));

    FOCUS(P_BLOCK);

    IF NOT FORM_SUCCESS THEN
      RAISE FORM_TRIGGER_FAILURE;
    END IF;

    APP_FORM.SET_MESSAGE_LEVEL(10);
    EXECUTE_QUERY;
    APP_FORM.RESET_MESSAGE_LEVEL();
    
    L_CURRENT_ITEM := STD_ITEM.NEW(NAME_IN('SYSTEM.CURSOR_ITEM'));

    IF NOT STD_ITEM.IS_NULL(L_INITIAL_FOCUSED_ITEM) 
      AND NOT STD_ITEM.EQUALS(L_CURRENT_ITEM, L_INITIAL_FOCUSED_ITEM)
    THEN
      STD_ITEM.FOCUS(L_INITIAL_FOCUSED_ITEM);
    END IF;
  END QUERY;

  
  PROCEDURE VALIDATE(P_BLOCK IN STD_BLOCK)
  IS
    L_INITIAL_FOCUSED_ITEM STD_STRUCTURE.STD_ITEM;
    L_VALID BOOLEAN := TRUE;

    PROCEDURE MAYBE_RESTORE_ITEM_FOCUS IS
      L_CURRENT_ITEM STD_STRUCTURE.STD_ITEM;
    BEGIN
      L_CURRENT_ITEM := STD_ITEM.NEW(NAME_IN('SYSTEM.CURSOR_ITEM'));

      IF NOT STD_ITEM.IS_NULL(L_INITIAL_FOCUSED_ITEM) 
        AND NOT STD_ITEM.EQUALS(L_CURRENT_ITEM, L_INITIAL_FOCUSED_ITEM)
      THEN
        STD_ITEM.FOCUS(L_INITIAL_FOCUSED_ITEM);
      END IF;
    END MAYBE_RESTORE_ITEM_FOCUS;
  BEGIN
    L_INITIAL_FOCUSED_ITEM := STD_ITEM.NEW(NAME_IN('SYSTEM.CURSOR_ITEM'));

    FOCUS(P_BLOCK);

    IF NOT FORM_SUCCESS THEN
      RAISE FORM_TRIGGER_FAILURE;
    END IF;

    STD_BLOCK_PRIVATE.VALIDATE_VERBOSE();
    
    MAYBE_RESTORE_ITEM_FOCUS();
  EXCEPTION
    WHEN OTHERS THEN
      MAYBE_RESTORE_ITEM_FOCUS();
      RAISE;
  END VALIDATE;

  
  PROCEDURE TRIGGER_EVENT(P_BLOCK IN STD_BLOCK, P_EVENT_NAME IN VARCHAR2)
  IS
    L_INITIAL_FOCUSED_ITEM STD_STRUCTURE.STD_ITEM;

    PROCEDURE MAYBE_RESTORE_ITEM_FOCUS IS
      L_CURRENT_ITEM STD_STRUCTURE.STD_ITEM;
    BEGIN
      L_CURRENT_ITEM := STD_ITEM.NEW(NAME_IN('SYSTEM.CURSOR_ITEM'));

      IF NOT STD_ITEM.IS_NULL(L_INITIAL_FOCUSED_ITEM) 
        AND NOT STD_ITEM.EQUALS(L_CURRENT_ITEM, L_INITIAL_FOCUSED_ITEM)
      THEN
        STD_ITEM.FOCUS(L_INITIAL_FOCUSED_ITEM);
      END IF;
    END MAYBE_RESTORE_ITEM_FOCUS;
  BEGIN
    L_INITIAL_FOCUSED_ITEM := STD_ITEM.NEW(NAME_IN('SYSTEM.CURSOR_ITEM'));

    FOCUS(P_BLOCK);

    IF NOT FORM_SUCCESS THEN
      RAISE FORM_TRIGGER_FAILURE;
    END IF;

    EXECUTE_TRIGGER(P_EVENT_NAME);

    MAYBE_RESTORE_ITEM_FOCUS();
  EXCEPTION
    WHEN OTHERS THEN
      MAYBE_RESTORE_ITEM_FOCUS();
      RAISE;
  END TRIGGER_EVENT;

  
  FUNCTION INSERT_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_INSERT_ALLOWED(P_BLOCK);
  END INSERT_ALLOWED;


  FUNCTION GET_INSERT_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.INSERT_ALLOWED);
  END GET_INSERT_ALLOWED;

  
  PROCEDURE SET_INSERT_ALLOWED(P_BLOCK IN STD_BLOCK, P_STATE IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.INSERT_ALLOWED, P_STATE);
  END SET_INSERT_ALLOWED;

  
  FUNCTION UPDATE_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_UPDATE_ALLOWED(P_BLOCK);
  END UPDATE_ALLOWED;


  FUNCTION GET_UPDATE_ALLOWED(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_BOOLEAN_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.UPDATE_ALLOWED);
  END GET_UPDATE_ALLOWED;

  
  FUNCTION CURRENT_RECORD(P_BLOCK IN STD_BLOCK) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_CURRENT_RECORD(P_BLOCK);
  END CURRENT_RECORD;


  FUNCTION GET_CURRENT_RECORD(P_BLOCK IN STD_BLOCK) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_NUMBER_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.CURRENT_RECORD);
  END GET_CURRENT_RECORD;

  
  PROCEDURE SET_UPDATE_ALLOWED(P_BLOCK IN STD_BLOCK, P_STATE IN BOOLEAN)
  IS
  BEGIN
    SET_BOOLEAN_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.UPDATE_ALLOWED, P_STATE);
  END SET_UPDATE_ALLOWED;


  FUNCTION DEFAULT_WHERE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_WHERE_CLAUSE(P_BLOCK);
  END DEFAULT_WHERE;


  FUNCTION GET_DEFAULT_WHERE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_WHERE_CLAUSE(P_BLOCK);
  END GET_DEFAULT_WHERE;


  FUNCTION WHERE_CLAUSE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_WHERE_CLAUSE(P_BLOCK);
  END WHERE_CLAUSE;


  FUNCTION GET_WHERE_CLAUSE(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.DEFAULT_WHERE);
  END GET_WHERE_CLAUSE;


  PROCEDURE SET_DEFAULT_WHERE(P_BLOCK IN STD_BLOCK, P_WHERE_CLAUSE IN VARCHAR2)
  IS
  BEGIN
    SET_WHERE_CLAUSE(P_BLOCK, P_WHERE_CLAUSE);
  END SET_DEFAULT_WHERE;


  PROCEDURE SET_WHERE_CLAUSE(P_BLOCK IN STD_BLOCK, P_WHERE_CLAUSE IN VARCHAR2)
  IS
  BEGIN
    SET_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.DEFAULT_WHERE, P_WHERE_CLAUSE);
  END SET_WHERE_CLAUSE;


  FUNCTION STATUS(P_BLOCK IN STD_BLOCK) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_STATUS(P_BLOCK);
  END STATUS;


  FUNCTION GET_STATUS(P_BLOCK IN STD_BLOCK) RETURN NUMBER
  IS
  BEGIN
    RETURN STD_CONVERT.STRING_TO_OBJECT_STATUS(GET_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.STATUS));
  END GET_STATUS;


  PROCEDURE SET_STATUS(P_BLOCK IN STD_BLOCK, P_BLOCK_STATUS IN NUMBER)
  IS
    PROCEDURE VALIDATE_STATUS
    IS
    BEGIN 
      IF P_BLOCK_STATUS NOT IN (
        STD_STRUCTURE.BLOCK_STATUS.NEW,
        STD_STRUCTURE.BLOCK_STATUS.NEW_DIRTY,
        STD_STRUCTURE.BLOCK_STATUS.QUERY,
        STD_STRUCTURE.BLOCK_STATUS.QUERY_DIRTY
      )
      THEN
        APP_EXCEPTION.INVALID_ARGUMENT('STD_BLOCK.SET_STATUS', 'P_BLOCK_STATUS', P_BLOCK_STATUS);
      END IF;
    END VALIDATE_STATUS;
  BEGIN
    VALIDATE_STATUS;
    
    SET_NUMBER_PROPERTY(P_BLOCK, STD_BLOCK_PROPS.STATUS, P_BLOCK_STATUS);
  END SET_STATUS;


  FUNCTION STATUS(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER) RETURN NUMBER
  IS
  BEGIN
    RETURN GET_STATUS(P_BLOCK, P_RECORD_NUMBER);
  END STATUS;


  FUNCTION GET_STATUS(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER) RETURN NUMBER
  IS
  BEGIN
    RETURN STD_CONVERT.STRING_TO_OBJECT_STATUS(GET_PROPERTY(P_BLOCK, P_RECORD_NUMBER, STD_BLOCK_PROPS.STATUS));
  END GET_STATUS;


  PROCEDURE SET_STATUS(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_BLOCK_STATUS IN NUMBER)
  IS
    PROCEDURE VALIDATE_STATUS
    IS
    BEGIN 
      IF P_BLOCK_STATUS NOT IN (
        STD_STRUCTURE.BLOCK_STATUS.NEW,
        STD_STRUCTURE.BLOCK_STATUS.NEW_DIRTY,
        STD_STRUCTURE.BLOCK_STATUS.QUERY,
        STD_STRUCTURE.BLOCK_STATUS.QUERY_DIRTY
      )
      THEN
        APP_EXCEPTION.INVALID_ARGUMENT('STD_BLOCK.SET_STATUS', 'P_BLOCK_STATUS', P_BLOCK_STATUS);
      END IF;
    END VALIDATE_STATUS;
  BEGIN
    VALIDATE_STATUS;
    
    SET_NUMBER_PROPERTY(P_BLOCK, P_RECORD_NUMBER, STD_BLOCK_PROPS.STATUS, P_BLOCK_STATUS);
  END SET_STATUS;


  FUNCTION IS_DIRTY(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_STATUS(P_BLOCK) IN (
        STD_STRUCTURE.BLOCK_STATUS.NEW_DIRTY,
        STD_STRUCTURE.BLOCK_STATUS.QUERY_DIRTY
    );
  END IS_DIRTY;


  FUNCTION IS_PRISTINE(P_BLOCK IN STD_BLOCK) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_STATUS(P_BLOCK) IN (
        STD_STRUCTURE.BLOCK_STATUS.NEW,
        STD_STRUCTURE.BLOCK_STATUS.QUERY
    );
  END IS_PRISTINE;


  PROCEDURE SET_DIRTY(P_BLOCK IN STD_BLOCK)
  IS
  BEGIN
    IF GET_STATUS(P_BLOCK) = STD_STRUCTURE.BLOCK_STATUS.NEW THEN
      SET_STATUS(P_BLOCK, STD_STRUCTURE.BLOCK_STATUS.NEW_DIRTY);
    ELSIF GET_STATUS(P_BLOCK) = STD_STRUCTURE.BLOCK_STATUS.QUERY THEN
      SET_STATUS(P_BLOCK, STD_STRUCTURE.BLOCK_STATUS.QUERY_DIRTY);
    END IF;
  END SET_DIRTY;


  PROCEDURE SET_DIRTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER)
  IS
  BEGIN
    IF GET_STATUS(P_BLOCK, P_RECORD_NUMBER) = STD_STRUCTURE.BLOCK_STATUS.NEW THEN
      SET_STATUS(P_BLOCK, P_RECORD_NUMBER, STD_STRUCTURE.BLOCK_STATUS.NEW_DIRTY);
    ELSIF GET_STATUS(P_BLOCK, P_RECORD_NUMBER) = STD_STRUCTURE.BLOCK_STATUS.QUERY THEN
      SET_STATUS(P_BLOCK, P_RECORD_NUMBER, STD_STRUCTURE.BLOCK_STATUS.QUERY_DIRTY);
    END IF;
  END SET_DIRTY;


  PROCEDURE SET_PRISTINE(P_BLOCK IN STD_BLOCK)
  IS
  BEGIN
    IF GET_STATUS(P_BLOCK) = STD_STRUCTURE.BLOCK_STATUS.NEW_DIRTY THEN
      SET_STATUS(P_BLOCK, STD_STRUCTURE.BLOCK_STATUS.NEW);
    ELSIF GET_STATUS(P_BLOCK) = STD_STRUCTURE.BLOCK_STATUS.QUERY_DIRTY THEN
      SET_STATUS(P_BLOCK, STD_STRUCTURE.BLOCK_STATUS.QUERY);
    END IF;
  END SET_PRISTINE;


  PROCEDURE SET_PRISTINE(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER)
  IS
  BEGIN
    IF GET_STATUS(P_BLOCK, P_RECORD_NUMBER) = STD_STRUCTURE.BLOCK_STATUS.NEW_DIRTY THEN
      SET_STATUS(P_BLOCK, P_RECORD_NUMBER, STD_STRUCTURE.BLOCK_STATUS.NEW);
    ELSIF GET_STATUS(P_BLOCK, P_RECORD_NUMBER) = STD_STRUCTURE.BLOCK_STATUS.QUERY_DIRTY THEN
      SET_STATUS(P_BLOCK, P_RECORD_NUMBER, STD_STRUCTURE.BLOCK_STATUS.QUERY);
    END IF;
  END SET_PRISTINE;


  ------------------------------------------------------------------------------
  -- Private API
  ------------------------------------------------------------------------------

  FUNCTION GET_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_BLOCK_PROPERTY(P_BLOCK.HANDLE, P_PROPERTY);
  END GET_PROPERTY;


  FUNCTION GET_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER) RETURN VARCHAR2
  IS
  BEGIN
    RETURN GET_RECORD_PROPERTY(P_RECORD_NUMBER, P_BLOCK.NAME, P_PROPERTY);
  END GET_PROPERTY;
  
  
  PROCEDURE SET_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_BLOCK_PROPERTY(P_BLOCK.HANDLE, P_PROPERTY, P_VALUE);
  END SET_PROPERTY;
  
  
  PROCEDURE SET_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER, P_VALUE IN VARCHAR2)
  IS
  BEGIN
    SET_RECORD_PROPERTY(P_RECORD_NUMBER, P_BLOCK.NAME, P_PROPERTY, P_VALUE);
  END SET_PROPERTY;
  

  FUNCTION GET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_PROPERTY(P_BLOCK, P_PROPERTY));
  END GET_NUMBER_PROPERTY;
  

  FUNCTION GET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER) RETURN NUMBER
  IS
  BEGIN
    RETURN TO_NUMBER(GET_PROPERTY(P_BLOCK, P_RECORD_NUMBER, P_PROPERTY));
  END GET_NUMBER_PROPERTY;
  

  PROCEDURE SET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER)
  IS
  BEGIN
    SET_BLOCK_PROPERTY(P_BLOCK.HANDLE, P_PROPERTY, TO_NUMBER(P_VALUE));
  END SET_NUMBER_PROPERTY;
  

  PROCEDURE SET_NUMBER_PROPERTY(P_BLOCK IN STD_BLOCK, P_RECORD_NUMBER IN NUMBER, P_PROPERTY IN NUMBER, P_VALUE IN NUMBER)
  IS
  BEGIN
    SET_RECORD_PROPERTY(P_RECORD_NUMBER, P_BLOCK.NAME, P_PROPERTY, TO_NUMBER(P_VALUE));
  END SET_NUMBER_PROPERTY;


  FUNCTION GET_BOOLEAN_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER) RETURN BOOLEAN
  IS
  BEGIN
    RETURN GET_PROPERTY(P_BLOCK, P_PROPERTY) = 'TRUE';
  END GET_BOOLEAN_PROPERTY;


  PROCEDURE SET_BOOLEAN_PROPERTY(P_BLOCK IN STD_BLOCK, P_PROPERTY IN NUMBER, P_STATE IN BOOLEAN)
  IS
    L_STATE NUMBER;
  BEGIN
    IF P_STATE THEN
      L_STATE := PROPERTY_TRUE;
    ELSE
      L_STATE := PROPERTY_FALSE;
    END IF;

    SET_BLOCK_PROPERTY(P_BLOCK.HANDLE, P_PROPERTY, L_STATE);
  END SET_BOOLEAN_PROPERTY;


  PROCEDURE GET_VALID_BLOCK_HANDLE(
    P_PROC_NAME IN VARCHAR2 DEFAULT 'STD_BLOCK.GET_VALID_BLOCK_HANDLE',
    P_BLOCK_NAME IN STD_TYPE.BLOCK_NAME,
    X_HANDLE OUT STD_TYPE.BLOCK_HANDLE
  )
  IS
    L_HANDLE STD_TYPE.BLOCK_HANDLE;
  BEGIN
    L_HANDLE := FIND_BLOCK(P_BLOCK_NAME);
    
    IF ID_NULL(L_HANDLE) THEN
      FND_MESSAGE.SET_STRING(P_PROC_NAME || ': Unable to find block ''' || P_BLOCK_NAME || '''');
      APP_EXCEPTION.RAISE_EXCEPTION;
    END IF;

    X_HANDLE := L_HANDLE;
  END GET_VALID_BLOCK_HANDLE;

  
--   FUNCTION BLOCK_NAME(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2
--   IS
--   BEGIN
--     RETURN GET_BLOCK_NAME(P_BLOCK);
--   END BLOCK_NAME;


--   FUNCTION GET_BLOCK_NAME(P_BLOCK IN STD_BLOCK) RETURN VARCHAR2
--   IS
--   BEGIN
--     RETURN P_BLOCK.NAME;
--   END GET_BLOCK_NAME;
  

END STD_BLOCK;