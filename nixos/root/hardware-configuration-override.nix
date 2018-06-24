{ config, lib, pkgs, ... }:

with lib;

let
  mkBind = device: {
    inherit device;
    fsType  = "none";
    options = [ "defaults" "bind" "rw" ];
  };
in

{
  boot = {
    tmpOnTmpfs = true;
    cleanTmpDir = true;

    # Bootloader
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  fileSystems = {
    "/mnt/hdd" =
      { device = "/dev/disk/by-partuuid/650fcfee-3cdd-46d0-acb0-d159eb4f6b07";
        fsType = "ntfs";
        options = [ "nofail" ];
      };

    "/home/srghma/Documents" = mkBind "/mnt/hdd/Documents";
    "/home/srghma/Downloads" = mkBind "/mnt/hdd/Downloads";
    "/home/srghma/Music"     = mkBind "/mnt/hdd/Music";
    "/home/srghma/Pictures"  = mkBind "/mnt/hdd/Pictures";
    "/home/srghma/Public"    = mkBind "/mnt/hdd/Public";
    "/home/srghma/Templates" = mkBind "/mnt/hdd/Templates";
    "/home/srghma/Videos"    = mkBind "/mnt/hdd/Videos";
  };
}
