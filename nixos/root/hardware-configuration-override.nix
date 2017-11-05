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

  boot = {
    tmpOnTmpfs = true;
    cleanTmpDir = true;
    loader = { # Bootloader
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  swapDevices = singleton
    { device = "/dev/disk/by-label/swap"; };
}
