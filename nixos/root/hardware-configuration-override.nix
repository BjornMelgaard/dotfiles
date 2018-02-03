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

    # Bootloader
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  fileSystems."/mnt/hdd" =
    { device = "/dev/sda5";
      fsType = "ntfs";
      options = [ "nofail" ];
    };
}
