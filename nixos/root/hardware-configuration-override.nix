{ config, lib, pkgs, ... }:

with import /etc/nixos/metaconfiguration.nix;
with lib;

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

  fileSystems =
  let
    hdd = {
      "/mnt/hdd" =
        { device = "/dev/disk/by-partuuid/650fcfee-3cdd-46d0-acb0-d159eb4f6b07";
          fsType = "ntfs";
          options = [ "nofail" ];
        };
    };

    homeMount = [
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Public"
      "Templates"
      "Videos"
    ];

    mkBind =
      x:
      {
        name = "/home/${userName}/${x}";
        value = {
          device  = "/mnt/hdd/${x}";
          fsType  = "none";
          options = [ "bind" ];
        };
      };

    binds = listToAttrs (map mkBind homeMount);

    merged = hdd // binds;
  in
  merged;
}
