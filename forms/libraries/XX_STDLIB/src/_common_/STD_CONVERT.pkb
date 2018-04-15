CREATE OR REPLACE PACKAGE BODY STD_CONVERT IS
    
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */

  ------------------------------------------------------------------------------
  -- Private types
  ------------------------------------------------------------------------------
  
  TYPE T_FALSY_VALUES IS TABLE OF VARCHAR2(10);
  

  ------------------------------------------------------------------------------
  -- Private constants
  ------------------------------------------------------------------------------

  GC_FALSY_VALUES CONSTANT T_FALSY_VALUES := T_FALSY_VALUES('N', 'F', 'FALSE', '0', 'NO');
  

  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION STRING_TO_OBJECT_STATUS(P_STRING_STATUS IN VARCHAR2) RETURN NUMBER
  IS
    L_STATUS NUMBER;
  BEGIN
    IF P_STRING_STATUS IS NULL THEN
      RETURN NULL;
    END IF;
    
    CASE P_STRING_STATUS
      WHEN 'NEW' THEN
        RETURN STD_STRUCTURE.RECORD_STATUS.NEW;
      WHEN 'INSERT' THEN
        RETURN STD_STRUCTURE.RECORD_STATUS.NEW_DIRTY; 
      WHEN 'QUERY' THEN
        RETURN STD_STRUCTURE.RECORD_STATUS.QUERY; 
      WHEN 'CHANGED' THEN
        RETURN STD_STRUCTURE.RECORD_STATUS.QUERY_DIRTY;
      WHEN 'NEW_DIRTY' THEN
        RETURN STD_STRUCTURE.RECORD_STATUS.NEW_DIRTY; 
      WHEN 'QUERY_DIRTY' THEN
        RETURN STD_STRUCTURE.RECORD_STATUS.QUERY_DIRTY;
      ELSE
        APP_EXCEPTION.RAISE_EXCEPTION('APP', 760, 'Unable to convert string to object status, invalid value: ''' || P_STRING_STATUS || '''');
    END CASE P_STRING_STATUS;
  END STRING_TO_OBJECT_STATUS;


  FUNCTION TO_BOOLEAN(P_VALUE IN VARCHAR2) RETURN BOOLEAN
  IS
  BEGIN
    RETURN UPPER(NVL(P_VALUE, 0)) NOT MEMBER OF GC_FALSY_VALUES;
  END TO_BOOLEAN;
  
  
  FUNCTION CLOB_TO_CLOB_CHUNKS(
    P_DATA IN OUT NOCOPY CLOB, 
    P_MAX_CHUNK_SIZE IN INTEGER
  ) RETURN STD_TYPE.CLOB_CHUNKS
  IS      
    L_CHUNKS STD_TYPE.CLOB_CHUNKS := STD_TYPE.CLOB_CHUNKS();
    L_BUFFER CLOB := P_DATA;
    L_CURRENT_CHUNK_SIZE INTEGER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(L_BUFFER, FALSE);
    DBMS_LOB.COPY(L_BUFFER, P_DATA, DBMS_LOB.GETLENGTH(P_DATA));
        
    IF DBMS_LOB.GETLENGTH(L_BUFFER) <= P_MAX_CHUNK_SIZE THEN
      L_CHUNKS.EXTEND(1);
      L_CHUNKS(L_CHUNKS.COUNT) := L_BUFFER;
    ELSE
      WHILE DBMS_LOB.GETLENGTH(L_BUFFER) > 0 LOOP     
        DECLARE
          L_CHUNK CLOB;
        BEGIN
          DBMS_LOB.CREATETEMPORARY(L_CHUNK, FALSE);
      
          IF DBMS_LOB.GETLENGTH(L_BUFFER) <= P_MAX_CHUNK_SIZE THEN
            L_CURRENT_CHUNK_SIZE := DBMS_LOB.GETLENGTH(L_BUFFER);
          ELSE
            L_CURRENT_CHUNK_SIZE := P_MAX_CHUNK_SIZE;
          END IF;
          
          DBMS_LOB.COPY(
            DEST_LOB => L_CHUNK,
            SRC_LOB => L_BUFFER,
            AMOUNT => L_CURRENT_CHUNK_SIZE
          );
          
          IF DBMS_LOB.GETLENGTH(L_BUFFER) - DBMS_LOB.GETLENGTH(L_CHUNK) > 0 THEN
            DECLARE
              L_TMP_BUFFER CLOB;
            BEGIN
              DBMS_LOB.CREATETEMPORARY(L_TMP_BUFFER, FALSE);
              
              DBMS_LOB.COPY(
                DEST_LOB => L_TMP_BUFFER,
                SRC_LOB => L_BUFFER,
                AMOUNT => DBMS_LOB.GETLENGTH(L_BUFFER) - DBMS_LOB.GETLENGTH(L_CHUNK),
                SRC_OFFSET => DBMS_LOB.GETLENGTH(L_CHUNK) + 1
              );
              
              L_BUFFER := L_TMP_BUFFER;
            END;
          ELSE
            DBMS_LOB.TRIM(L_BUFFER, 0);
          END IF;
                  
          L_CHUNKS.EXTEND(1);
          L_CHUNKS(L_CHUNKS.COUNT) := L_CHUNK;
        END;
      END LOOP;
    END IF;
    
    RETURN L_CHUNKS;
  END CLOB_TO_CLOB_CHUNKS;
  
END STD_CONVERT;