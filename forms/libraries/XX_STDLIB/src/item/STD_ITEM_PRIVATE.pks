CREATE OR REPLACE PACKAGE STD_ITEM_PRIVATE IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
   
  ------------------------------------------------------------------------------
  -- Custom types
  ------------------------------------------------------------------------------

  SUBTYPE STD_ITEM IS STD_STRUCTURE.STD_ITEM;


  ------------------------------------------------------------------------------
  -- Private API
  ------------------------------------------------------------------------------

  FUNCTION GET_CUSTOM_PROPERTY_PROXY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER) RETURN VARCHAR2;  

  PROCEDURE SET_CUSTOM_PROPERTY_PROXY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN VARCHAR2);  

  PROCEDURE SET_CUSTOM_PROPERTY_PROXY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN NUMBER);  

  PROCEDURE SET_CUSTOM_PROPERTY_PROXY(P_ITEM IN STD_ITEM, P_PROPERTY IN STD_STRUCTURE.STD_PROPERTY, P_RECORD_NUMBER IN NUMBER, P_VALUE IN BOOLEAN);  

  PROCEDURE DEFAULT_VALUE_PROXY(P_ITEM IN STD_ITEM, P_VALUE IN VARCHAR2);

END STD_ITEM_PRIVATE;