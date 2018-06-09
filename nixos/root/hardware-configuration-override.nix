{ config, lib, pkgs, ... }:

with import /etc/nixos/metaconfiguration.nix;
with lib;

let
  mkBind = device: {
    inherit device;
    fsType  = "none";
    options = [ "bind" "rw" ];
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

    "/home/${userName}/Documents" = mkBind "/mnt/hdd/Documents";
    "/home/${userName}/Downloads" = mkBind "/mnt/hdd/Downloads";
    "/home/${userName}/Music"     = mkBind "/mnt/hdd/Music";
    "/home/${userName}/Pictures"  = mkBind "/mnt/hdd/Pictures";
    "/home/${userName}/Public"    = mkBind "/mnt/hdd/Public";
    "/home/${userName}/Templates" = mkBind "/mnt/hdd/Templates";
    "/home/${userName}/Videos"    = mkBind "/mnt/hdd/Videos";
  };
}
