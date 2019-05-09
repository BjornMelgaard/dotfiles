{ config, lib, pkgs, ... }:

{
  hardware.brightnessctl.enable = true;

  boot = {
    tmpOnTmpfs = false;
    cleanTmpDir = true;
    supportedFilesystems = [ "zfs" ];

    kernelParams = [
      (let _12_g_in_bytes = 12 * 1024 * 1024 * 1024 ; in "zfs.zfs_arc_max=${toString _12_g_in_bytes}")
    ];

    # Bootloader
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };
}
