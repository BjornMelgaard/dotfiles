# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];

  fileSystems."/" =
    { device = "mypool/root";
      fsType = "zfs";
    };

  fileSystems."/tmp" =
    { device = "mypool/tmp";
      fsType = "zfs";
    };

  fileSystems."/var/cache" =
    { device = "mypool/var_cache";
      fsType = "zfs";
    };

  fileSystems."/var/tmp" =
    { device = "mypool/var_tmp";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/64FD-0ED9";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/5f09addd-be26-41b5-8d09-26a42d2c3424"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
