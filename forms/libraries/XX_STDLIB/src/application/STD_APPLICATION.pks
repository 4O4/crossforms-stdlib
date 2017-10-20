CREATE OR REPLACE PACKAGE STD_APPLICATION IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  /**
   * Returns the pointer value of an instance handle. Only applies to the
   * Microsoft Windows platform. For all other platforms, Form Builder
   * returns NULL.
   */
  FUNCTION INSTANCE RETURN VARCHAR2;
  FUNCTION GET_INSTANCE RETURN VARCHAR2;

  /**
   * Returns the current value of the Builtin date format mask (which is held in
   * the Builtin_Date_Format property).
   */
  FUNCTION BUILTIN_DATE_FORMAT RETURN VARCHAR2;
  FUNCTION GET_BUILTIN_DATE_FORMAT RETURN VARCHAR2;

  PROCEDURE SET_BUILTIN_DATE_FORMAT(P_DATE_FORMAT IN VARCHAR2);

  /**
   * Returns the name of the calling form if the current form was invoked by the
   * CALL_FORM built-in. If the current form is not a called form, Form Builder 
   * returns NULL.
   */
  FUNCTION CALLING_FORM RETURN VARCHAR2;
  FUNCTION GET_CALLING_FORM RETURN VARCHAR2;

  /**
   * Returns the database connect string of the current operator. If the current
   * operator does not have a connect string, Form Builder returns NULL.
   */
  FUNCTION CONNECT_STRING RETURN VARCHAR2;
  FUNCTION GET_CONNECT_STRING RETURN VARCHAR2;

  /**
   * Returns the .FMX file name of the form currently being executed.
   */
  FUNCTION CURRENT_FORM_FILENAME RETURN VARCHAR2;
  FUNCTION GET_CURRENT_FORM_FILENAME RETURN VARCHAR2;

  /**
   * Returns the name of the current form as indicated by the form module Name property.
   */
  FUNCTION CURRENT_FORM_NAME RETURN VARCHAR2;
  FUNCTION GET_CURRENT_FORM_NAME RETURN VARCHAR2;

  /**
   * Returns the name of the current cursor style property. Valid VARCHAR2 return 
   * values are BUSY, CROSSHAIR, DEFAULT , HELP, and INSERTION.
   */
  FUNCTION CURSOR_STYLE RETURN VARCHAR2;
  FUNCTION GET_CURSOR_STYLE RETURN VARCHAR2;
  
  PROCEDURE SET_CURSOR_STYLE(P_CURSOR_STYLE IN VARCHAR2);

  /**
   * Returns the name of the database that is currently in use. Valid return values 
   * are NULL, ORACLE, DB2, NONSTOP, TERADATA , NCR/3600/NCR/3700, and SQLSERVER. 
   * This call returns the database name only for connections established by Form 
   * Builder, not for connections established by On-Logon triggers.
   */
  FUNCTION DATASOURCE RETURN VARCHAR2;
  FUNCTION GET_DATASOURCE RETURN VARCHAR2;

  /**
   * Returns the compatibility setting contained in this property.
   */
  FUNCTION DATE_FORMAT_COMPAT_MODE RETURN VARCHAR2;
  FUNCTION GET_DATE_FORMAT_COMPAT_MODE RETURN VARCHAR2;
  
  PROCEDURE SET_DATE_FORMAT_COMPAT_MODE(P_MODE IN VARCHAR2);

  /**
   * Returns the height of the display. The size of each unit depends on how you
   * defined the Coordinate System property for the form module.
   */
  FUNCTION DISPLAY_HEIGHT RETURN VARCHAR2;
  FUNCTION GET_DISPLAY_HEIGHT RETURN VARCHAR2;

  /**
   * Returns the width of the display. The size of each unit depends on how you 
   * defined the Coordinate System property for the form module.
   */
  FUNCTION DISPLAY_WIDTH RETURN VARCHAR2;
  FUNCTION GET_DISPLAY_WIDTH RETURN VARCHAR2;

  /**
   * Returns the current value of the error date format mask (which is established
   * in th e FORMSnn_Error_Date_Format environment variable).
   */
  FUNCTION ERROR_DATE_FORMAT RETURN VARCHAR2;
  FUNCTION GET_ERROR_DATE_FORMAT RETURN VARCHAR2;

  /**
   * Returns the current value of the error datetime format mask (which is 
   * established in th e FORMSnn_Error_Datetime_Format environment variable).
   */
  FUNCTION ERROR_DATETIME_FORMAT RETURN VARCHAR2;
  FUNCTION GET_ERROR_DATETIME_FORMAT RETURN VARCHAR2;

  /**
   * Returns the current value of this property, either ‘TRUE’ or ‘FALSE’, 
   * which controls truncation of userentered values that exceed an item’s 
   * Maximum Length property.
   */
  FUNCTION FLAG_USER_VALUE_TOO_LONG RETURN BOOLEAN;
  FUNCTION GET_FLAG_USER_VALUE_TOO_LONG RETURN BOOLEAN;
  
  PROCEDURE SET_FLAG_USER_VALUE_TOO_LONG(P_STATE IN BOOLEAN);

  /**
   * Returns the name of the operating system that is currently in use. Valid
   * return values are MSWINDOWS , MSWINDOWS32, WIN32COMMON, UNIX, SunOS, 
   * MACINTOSH , VMS, and HP-UX.
   */
  FUNCTION OPERATING_SYSTEM RETURN VARCHAR2;
  FUNCTION GET_OPERATING_SYSTEM RETURN VARCHAR2;

  /**
   * Returns the current value of the output date format mask (which is
   * established in th e FORMSnn_Output_Date/Datetime_Format environment 
   * variable).
   */
  FUNCTION OUTPUT_DATE_FORMAT RETURN VARCHAR2;
  FUNCTION GET_OUTPUT_DATE_FORMAT RETURN VARCHAR2;

  /**
   * Returns the current value of the output datetime format mask (which is 
   * established in th e FORMSnn_Output_Date/Datetime_Format environment 
   * variable).
   */
  FUNCTION OUTPUT_DATETIME_FORMAT RETURN VARCHAR2;
  FUNCTION GET_OUTPUT_DATETIME_FORMAT RETURN VARCHAR2;

  /**
   * Returns the password of the current operator.
   */
  FUNCTION PASSWORD RETURN VARCHAR2;
  FUNCTION GET_PASSWORD RETURN VARCHAR2;

  /**
   * Returns the current value of the PLSQL date format mask (which is held 
   * in the PLSQL_Date_Format property).
   */
  FUNCTION PLSQL_DATE_FORMAT RETURN VARCHAR2;
  FUNCTION GET_PLSQL_DATE_FORMAT RETURN VARCHAR2;
  
  PROCEDURE SET_PLSQL_DATE_FORMAT(P_DATE_FORMAT IN VARCHAR2);

  /**
   * Returns the name of the last savepoint Form Builder has issued. This call is 
   * valid only from an On-Savepoint or On- Rollback trigger. It is included 
   * primarily for developers who are using transactional triggers to access 
   * a non-ORACLE data source.
   */
  FUNCTION SAVEPOINT_NAME RETURN VARCHAR2;
  FUNCTION GET_SAVEPOINT_NAME RETURN VARCHAR2;

  /**
   * Returns the name of the most recently expired timer. Form Builder returns 
   * NULL in response to this constant if there is no timer.
   */
  FUNCTION TIMER_NAME RETURN VARCHAR2;
  FUNCTION GET_TIMER_NAME RETURN VARCHAR2;

  /**
   * Returns the current value of the user date format mask (which is established
   * in th e FORMSnn_User_Date_Format environment variable).
   */
  FUNCTION USER_DATE_FORMAT RETURN VARCHAR2;
  FUNCTION GET_USER_DATE_FORMAT RETURN VARCHAR2;

  /**
   * Returns the current value of the user datetime format mask (which is 
   * established in th e FORMSnn_User_Datetime_Format environment variable).
   */
  FUNCTION USER_DATETIME_FORMAT RETURN VARCHAR2;
  FUNCTION GET_USER_DATETIME_FORMAT RETURN VARCHAR2;

  /**
   * Returns the name of the user interface that is currently in use. Valid return
   * values are MOTIF, MACINTOSH , MSWINDOWS, MSWINDOWS32, WIN32COMMON, WEB, PM ,
   * CHARMODE, BLOCKMODE, X, and UNKNOWN.
   */
  FUNCTION USER_INTERFACE RETURN VARCHAR2;
  FUNCTION GET_USER_INTERFACE RETURN VARCHAR2;

  /**
   * Returns the current value of the character set portion only of the USER_NLS_LANG
   * environment variable defined for the form operator. If USER_NLS_LANG is not
   * explicitly set, it defaults to the setting of NLS_LANG.
   */
  FUNCTION USER_NLS_CHARACTER_SET RETURN VARCHAR2;
  FUNCTION GET_USER_NLS_CHARACTER_SET RETURN VARCHAR2;

  /**
   * Returns the complete current value of th e USER_NLS_LANG environment variable
   * defined for the form operator, for national language support. If USER_NLS_LANG
   * is not explicitly set, it defaults to the setting of NLS_LANG. USER_NLS_LANG
   * is the equivalent of concatenating USER_NLS_LANGUAGE , USER_NLS_TERRITORY,
   * and USER_NLS_CHARACTER_SET.
   */
  FUNCTION USER_NLS_LANG RETURN VARCHAR2;
  FUNCTION GET_USER_NLS_LANG RETURN VARCHAR2;

  /**
   * Returns the current value of the language portion only of the USER_NLS_LANG
   * environment variable defined for the form operator. If USER_NLS_LANG is not
   * explicitly set, it defaults to the setting of NLS_LANG.
   */
  FUNCTION USER_NLS_LANGUAGE RETURN VARCHAR2;
  FUNCTION GET_USER_NLS_LANGUAGE RETURN VARCHAR2;

  /**
   * Returns the current value of the territory portion only of the USER_NLS_LANG
   * environment variable defined for the form operator. If USER_NLS_LANG is not
   * explicitly set, it defaults to the setting of NLS_LANG.
   */
  FUNCTION USER_NLS_TERRITORY RETURN VARCHAR2;
  FUNCTION GET_USER_NLS_TERRITORY RETURN VARCHAR2;

  /**
   * Returns the name of the current operator. Note: If the user connects by 
   * using an OPS$ account, it will not return the actual username. In this 
   * case, you should use CONNECT_STRING to retrieve username information.
   */
  FUNCTION USERNAME RETURN VARCHAR2;
  FUNCTION GET_USERNAME RETURN VARCHAR2;


END STD_APPLICATION;