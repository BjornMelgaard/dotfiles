{ config, lib, pkgs, ... }:

with (import /etc/nixos/metaconfiguration.nix);

{
  nixpkgs.config.allowUnfree = true;

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;
    extraUsers =
      # generated via: mkpasswd -m sha-512
      let hashedPassword = "$6$Xne/w.j0RkrN$lRcThoZiNea2YBhfbeVJ2dgylt6Ov0IZbh1bf3flR6DYNpnv8YTTPJGwhk/8XPGNkgIrlKtXfvBowCZ7nbVt6/";
      in {
        root = {
          inherit hashedPassword;
        };
        ${userName} = {
          isNormalUser = true;
          extraGroups = [ "audio" "disk" "wheel" "networkmanager" "docker" "vboxusers" ];
          inherit hashedPassword;
        };
      };
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  networking = {
    hostName = "machine";
    networkmanager.enable = true;

    # firewall = {
    #   enable = true;
    #   allowPing = false;
    #   allowedTCPPorts = [ 35732 ];
    # };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Kiev";
  nix.extraOptions = "auto-optimise-store = true";
  nix.gc.automatic = false;
}
