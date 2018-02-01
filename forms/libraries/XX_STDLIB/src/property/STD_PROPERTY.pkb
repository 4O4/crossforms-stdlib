CREATE OR REPLACE PACKAGE BODY STD_PROPERTY IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_PROPERTY_NAME IN STD_TYPE.PROPERTY_NAME) RETURN STD_PROPERTY
  IS
    L_PROPERTY STD_PROPERTY;
  BEGIN
    STD_TYPE.VALIDATE('STD_PROPERTY.NEW', 'P_PROPERTY_NAME', P_PROPERTY_NAME, STD_TYPE.ARG_TYPE.PROPERTY_NAME);

    L_PROPERTY.NAME := UPPER(P_PROPERTY_NAME);

    RETURN L_PROPERTY;
  END NEW;


  FUNCTION IS_NULL(P_PROPERTY IN STD_PROPERTY) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_PROPERTY.NAME = '_NULL_PROPERTY_';
  END IS_NULL;

	
END STD_PROPERTY;