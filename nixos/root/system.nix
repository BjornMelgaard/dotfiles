{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # nix.trustedUsers = [ "root" "@wheel" ];

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;
    extraUsers =
      let hashedPassword = "$6$Xne/w.j0RkrN$lRcThoZiNea2YBhfbeVJ2dgylt6Ov0IZbh1bf3flR6DYNpnv8YTTPJGwhk/8XPGNkgIrlKtXfvBowCZ7nbVt6/";
      in {
        root = {
          inherit hashedPassword;
        };
        bjorn = {
          isNormalUser = true;
          extraGroups = [ "audio" "disk" "wheel" "networkmanager" ];
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

    firewall = {
      enable = true;
      allowPing = false;
    };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Kiev";
}
