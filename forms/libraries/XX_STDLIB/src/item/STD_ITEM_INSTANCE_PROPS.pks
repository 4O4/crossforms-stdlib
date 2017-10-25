CREATE OR REPLACE PACKAGE STD_ITEM_INSTANCE_PROPS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public namespace for Built-in Item Instance Properties
  ------------------------------------------------------------------------------

  BORDER_BEVEL                   CONSTANT NUMBER := STD_ITEM_INSTANCE_PROPS_PRIV.IIP#BORDER_BEVEL;
  INSERT_ALLOWED                 CONSTANT NUMBER := STD_ITEM_INSTANCE_PROPS_PRIV.IIP#INSERT_ALLOWED;
  NAVIGABLE                      CONSTANT NUMBER := STD_ITEM_INSTANCE_PROPS_PRIV.IIP#NAVIGABLE;
  REQUIRED                       CONSTANT NUMBER := STD_ITEM_INSTANCE_PROPS_PRIV.IIP#REQUIRED;
  SELECTED_RADIO_BUTTON          CONSTANT NUMBER := STD_ITEM_INSTANCE_PROPS_PRIV.IIP#SELECTED_RADIO_BUTTON;
  UPDATE_ALLOWED                 CONSTANT NUMBER := STD_ITEM_INSTANCE_PROPS_PRIV.IIP#UPDATE_ALLOWED;
  VISUAL_ATTRIBUTE               CONSTANT NUMBER := STD_ITEM_INSTANCE_PROPS_PRIV.IIP#VISUAL_ATTRIBUTE;

END STD_ITEM_INSTANCE_PROPS;