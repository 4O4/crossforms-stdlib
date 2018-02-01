CREATE OR REPLACE PACKAGE STD_ITEM_CUSTOM_PROPS IS
	
  /*
   * STDLIB for Oracle Forms 10g
   * Copyright (c) 2017, Paweł Kierzkowski
   * License: MIT
   */
	
  ------------------------------------------------------------------------------
  -- Public namespace for Custom Item Properties
  ------------------------------------------------------------------------------

   MULTIPART_SUPPORTED           CONSTANT STD_STRUCTURE.STD_PROPERTY := STD_PROPERTY.NEW('MULTIPART_SUPPORTED');
   MULTIPART_RESET               CONSTANT STD_STRUCTURE.STD_PROPERTY := STD_PROPERTY.NEW('MULTIPART_RESET');
   MULTIPART_NEXT_CHUNK          CONSTANT STD_STRUCTURE.STD_PROPERTY := STD_PROPERTY.NEW('MULTIPART_NEXT_CHUNK');
   MULTIPART_DESTINATION         CONSTANT STD_STRUCTURE.STD_PROPERTY := STD_PROPERTY.NEW('MULTIPART_DESTINATION');
   MULTIPART_EOT                 CONSTANT STD_STRUCTURE.STD_PROPERTY := STD_PROPERTY.NEW('MULTIPART_EOT');

END STD_ITEM_CUSTOM_PROPS;