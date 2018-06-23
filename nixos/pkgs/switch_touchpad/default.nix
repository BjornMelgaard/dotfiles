{ writeScriptBin, lib }:

writeScriptBin "switch_touchpad" (lib.readFile ./switch_touchpad)
