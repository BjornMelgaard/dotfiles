{ config, lib, pkgs, ... }:

{
  boot = {
    tmpOnTmpfs = false;
    cleanTmpDir = true;

    # Bootloader
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };
}
