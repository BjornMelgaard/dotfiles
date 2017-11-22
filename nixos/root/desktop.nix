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
        power = {
          event = "button/power";
          action = "${pkgs.systemd}/bin/systemctl poweroff";
        };
      };
    };

    logind.extraConfig = "HandleLidSwitch=ignore";

    xserver = {
      enable = true;

      layout = "us,ru";
      xkbOptions = "caps:swapescape,grp:rctrl_rshift_toggle";
      xkbVariant = "qwerty";

      dpi = 96;
      deviceSection = ''
        Option   "DPI"            "96 x 96"
      '';

      windowManager = {
        default = "i3";
        i3 = {
          enable = true;
        };
        # default = "xmonad";
        # xmonad = {
        #   enable = true;
        #   enableContribAndExtras = true;
        #   extraPackages = with pkgs.haskellPackages; haskellPackages: [ xmobar ];
        # };
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
