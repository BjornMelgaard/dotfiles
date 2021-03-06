{ config, lib, pkgs, ... }:

with lib;

{
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true; # for steam
    };

    bluetooth.enable = false;

    opengl = {
      enable = true;
      driSupport32Bit = true; # for steam
    };
  };
}
