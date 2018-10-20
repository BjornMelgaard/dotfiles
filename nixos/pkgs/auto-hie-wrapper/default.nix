{ writeScriptBin, lib }:

# TODO: wrapProgram with hies

writeScriptBin "auto-hie-wrapper" (lib.readFile ./auto-hie-wrapper)
