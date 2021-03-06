CREATE OR REPLACE PACKAGE BODY STD_EVENT IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public API
  ------------------------------------------------------------------------------

  FUNCTION NEW(P_EVENT_NAME IN STD_TYPE.EVENT_NAME) RETURN STD_EVENT
  IS
    L_EVENT STD_EVENT;
    LC_TRIGGER_ITEM CONSTANT STD_TYPE.FULL_ITEM_NAME := XFRM.NAME_IN('SYSTEM.TRIGGER_ITEM');
    LC_TRIGGER_BLOCK CONSTANT STD_TYPE.BLOCK_NAME := XFRM.NAME_IN('SYSTEM.TRIGGER_BLOCK');
    LC_CURRENT_FORM CONSTANT STD_TYPE.FORM_NAME := XFRM.NAME_IN('SYSTEM.CURRENT_FORM');
    LC_TRIGGER_RECORD CONSTANT NUMBER := XFRM.NAME_IN('SYSTEM.TRIGGER_RECORD');
    LC_EVENT_WINDOW CONSTANT STD_TYPE.WINDOW_NAME := XFRM.NAME_IN('SYSTEM.EVENT_WINDOW');
  BEGIN
    L_EVENT.NAME := UPPER(P_EVENT_NAME);

    IF LC_TRIGGER_ITEM IS NOT NULL THEN
      L_EVENT.ITEM := STD_ITEM.NEW(LC_TRIGGER_ITEM);
    END IF;

    IF LC_TRIGGER_BLOCK IS NOT NULL THEN
      L_EVENT.BLOCK := STD_BLOCK.NEW(LC_TRIGGER_BLOCK);
    END IF;

    IF LC_EVENT_WINDOW IS NOT NULL THEN
      L_EVENT.WINDOW := STD_WINDOW.NEW(LC_EVENT_WINDOW);
    END IF;

    IF P_EVENT_NAME = 'WHEN-TAB-PAGE-CHANGED' THEN
      L_EVENT.TAB_PAGE.NEW := STD_TAB_PAGE.NEW(XFRM.NAME_IN('SYSTEM.TAB_NEW_PAGE'));
      L_EVENT.TAB_PAGE.PREVIOUS := STD_TAB_PAGE.NEW(XFRM.NAME_IN('SYSTEM.TAB_PREVIOUS_PAGE'));
    END IF;

    L_EVENT.FORM_NAME := LC_CURRENT_FORM;
    L_EVENT.RECORD_NUMBER := LC_TRIGGER_RECORD;

    RETURN L_EVENT;
  END NEW;


  FUNCTION NEW(
    P_EVENT_NAME IN STD_TYPE.EVENT_NAME,
    P_PARENT_EVENT IN STD_EVENT
  ) RETURN STD_EVENT
  IS
    L_EVENT STD_EVENT := P_PARENT_EVENT;
  BEGIN
    IF IS_NULL(P_PARENT_EVENT) THEN
      RETURN NEW(P_EVENT_NAME);
    END IF;

    L_EVENT.PARENT_NAME := P_PARENT_EVENT.NAME;
    L_EVENT.NAME := P_EVENT_NAME;

    RETURN L_EVENT;
  END NEW;


  FUNCTION IS_NULL(P_EVENT IN STD_EVENT) RETURN BOOLEAN
  IS
  BEGIN
    RETURN P_EVENT.NAME = '_NULL_EVENT_';
  END IS_NULL;
	
END STD_EVENT;