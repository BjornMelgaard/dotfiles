{ config, lib, pkgs, ... }:

with lib;

{
  hardware = {
    pulseaudio.enable = true;
    # bluetooth.enable = false;
    opengl = {
      driSupport32Bit = true;
      enable = true;
    };
  };
}
