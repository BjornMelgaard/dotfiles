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

  fileSystems."/mnt/hdd" =
    { device = "/dev/disk/by-uuid/22528F11528EE93D";
      fsType = "ntfs";
      options = [ "nofail" ];
    };
}
