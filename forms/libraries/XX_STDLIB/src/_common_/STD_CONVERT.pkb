CREATE OR REPLACE PACKAGE BODY STD_CONVERT IS
    
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
  
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION STRING_TO_OBJECT_STATUS(P_STRING_STATUS IN VARCHAR2) RETURN NUMBER
  IS
    L_STATUS NUMBER;
  BEGIN
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
  
END STD_CONVERT;