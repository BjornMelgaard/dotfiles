{ config, lib, pkgs, ... }:

with lib;

{
  hardware = {
    pulseaudio.enable = true;
    bluetooth.enable = false;
    bumblebee = {
      enable = true;
      driver = "nvidia";
    };
    opengl = {
      driSupport32Bit = true;
      enable = true;
    };
  };
}
