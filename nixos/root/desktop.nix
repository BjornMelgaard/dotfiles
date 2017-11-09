{ config, pkgs, xorg, lib, ... }:

with lib;

let
  dotfilesDir=/home/bjorn/.config/dotfiles;
in {
  services = {
    openssh.enable = true;
    xbanish.enable = true;
    compton.enable = true;

    gnome3.gnome-documents.enable = false;
    gnome3.gnome-online-accounts.enable = false;
    gnome3.gnome-terminal-server.enable = false;
    gnome3.gnome-user-share.enable = false;
    gnome3.tracker.enable = false;

    redshift = {
      enable = true;
      latitude = "50";
      longitude = "30";
    };

    acpid = {
      enable = true;
      handlers = {
        volumeUp = {
          event = "button/volumeup";
          action = "${pkgs.dunsted-volume}/bin/dunsted-volume up";
        };
        volumeDown = {
          event = "button/volumedown";
          action = "${pkgs.dunsted-volume}/bin/dunsted-volume down";
        };
        mute = {
          event = "button/mute";
          action = "${pkgs.dunsted-volume}/bin/dunsted-volume mute";
        };
      };
    };

    xserver = {
      enable = true;
      # defaultApps =[
      #   {mimetypes = ["image/png" "image/jpeg" "image/gif" "image/x-apple-ios-png"]; exec = "${pkgs.gpicview}/bin/gpicview";}
      #   {mimetypes = ["text/plain" "text/css"]; exec = "${pkgs.e19.ecrire}/bin/ecrire";}
      #   {mimetypes = ["text/html"]; exec = "${pkgs.firefox}/bin/firefox";}
      #   {mimetypes = ["inode/directory"]; exec = "/run/current-system/sw/bin/spacefm";}
      #   {mimetypes = ["x-scheme-handler/http" "x-scheme-handler/https"]; exec = "/run/current-system/sw/bin/firefox";}
      #   {mimetypes = ["application/x-compressed-tar" "application/zip"]; exec = "/run/current-system/sw/bin/xarchiver";}
      # ];

      layout = "us,ru";
      xkbOptions = "caps:swapescape,grp:rctrl_rshift_toggle";
      xkbVariant = "qwerty";

      windowManager = {
        default = "i3";
        i3.enable = true;
      };

      desktopManager = {
        default = "gnome3";
        gnome3.enable = true;
      };

      displayManager = {
        lightdm = {
          enable = true;
          autoLogin = {
            enable = true;
            user = "bjorn";
          };
        };
        sessionCommands = ''
          ${pkgs.xorg.xinput}/bin/xinput --disable 'ETPS/2 Elantech Touchpad'
          ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${dotfilesDir}/layouts/en_ru $DISPLAY
          ${pkgs.copyq}/bin/copyq &
        '';
      };
    };
  };
}
