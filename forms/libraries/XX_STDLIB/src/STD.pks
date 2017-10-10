CREATE OR REPLACE PACKAGE STD IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  -----------------------------------------------------------------
  --- STD_TYPE types aliases
  -----------------------------------------------------------------

  SUBTYPE OBJECT_NAME IS STD_TYPE.OBJECT_NAME;
  SUBTYPE ITEM_NAME IS STD_TYPE.ITEM_NAME;
  SUBTYPE BLOCK_NAME IS STD_TYPE.BLOCK_NAME;
  SUBTYPE WINDOW_NAME IS STD_TYPE.WINDOW_NAME;
  SUBTYPE CANVAS_NAME IS STD_TYPE.CANVAS_NAME;
  SUBTYPE TAB_PAGE_NAME IS STD_TYPE.TAB_PAGE_NAME;  
  SUBTYPE FULL_ITEM_NAME IS STD_TYPE.FULL_ITEM_NAME;
  SUBTYPE MAX_VARCHAR2_DB IS STD_TYPE.MAX_VARCHAR2_DB;
  SUBTYPE MAX_VARCHAR2_PLSQL IS STD_TYPE.MAX_VARCHAR2_PLSQL;
  SUBTYPE EVENT_NAME IS STD_TYPE.EVENT_NAME;
  
  
  -----------------------------------------------------------------
  --- STD_EVENT types aliases
  -----------------------------------------------------------------

  SUBTYPE EVENT IS STD_EVENT.STD_EVENT;
  
  
  -----------------------------------------------------------------
  --- STD_ITEM types aliases
  -----------------------------------------------------------------

  SUBTYPE ITEM IS STD_ITEM.STD_ITEM;
  
  
  -----------------------------------------------------------------
  --- STD_BLOCK types aliases
  -----------------------------------------------------------------

  SUBTYPE BLOCK IS STD_BLOCK.STD_BLOCK;
  
  
  -----------------------------------------------------------------
  --- STD_CANVAS types aliases
  -----------------------------------------------------------------

  SUBTYPE CANVAS IS STD_CANVAS.STD_CANVAS;
  
  
  -----------------------------------------------------------------
  --- STD_TAB_PAGE types aliases
  -----------------------------------------------------------------

  SUBTYPE TAB_PAGE IS STD_TAB_PAGE.STD_TAB_PAGE;


  ------------------------------------------------------------------------------
  -- STD_TYPE constants' aliases
  ------------------------------------------------------------------------------

  ARG_TYPE CONSTANT STD_TYPE.ARGUMENT_TYPES := STD_TYPE.ARG_TYPE;
  
END STD;