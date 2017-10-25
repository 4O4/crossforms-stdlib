CREATE OR REPLACE PACKAGE STD_ITEM_INSTANCE_PROPS_PRIV IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Private namespace for Built-in Item Instance Properties (name-collision-safe)
  ------------------------------------------------------------------------------

  IIP#BORDER_BEVEL               CONSTANT NUMBER := XFRM.BORDER_BEVEL;
  IIP#INSERT_ALLOWED             CONSTANT NUMBER := XFRM.INSERT_ALLOWED;
  IIP#NAVIGABLE                  CONSTANT NUMBER := XFRM.NAVIGABLE;
  IIP#REQUIRED                   CONSTANT NUMBER := XFRM.REQUIRED;
  IIP#SELECTED_RADIO_BUTTON      CONSTANT NUMBER := XFRM.SELECTED_RADIO_BUTTON;
  IIP#UPDATE_ALLOWED             CONSTANT NUMBER := XFRM.UPDATE_ALLOWED;
  IIP#VISUAL_ATTRIBUTE           CONSTANT NUMBER := XFRM.VISUAL_ATTRIBUTE;
  
END STD_ITEM_INSTANCE_PROPS_PRIV;