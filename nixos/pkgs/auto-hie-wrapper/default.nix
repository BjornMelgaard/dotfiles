{ writeScriptBin, lib, hies }:

writeScriptBin "auto-hie-wrapper" (lib.readFile ./auto-hie-wrapper)
