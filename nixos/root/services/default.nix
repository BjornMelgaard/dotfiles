{ pkgs, ... }:

with pkgs;

let
  layout = ../../../layouts/en_ru;
in

rec {
  # see https://github.com/NixOS/nixpkgs/blob/cad1c18743699fa7458f1e49f6cfab0b86b024e9/nixos/modules/services/databases/postgresql.nix#L12

  # To connect by local:
  # HOST_IP=`ip -4 addr show scope global dev docker0 | grep inet | awk '{print $2}' | cut -d / -f 1`
  # or
  # HOST_IP=`ip -4 addr show wlp3s0 | grep inet | awk '{print $2}' | cut -d / -f 1`
  # psql --dbname=postgres://foo:bar@$HOST_IP:5432/dev_db

  # To connect by from docker container (https://github.com/docker/for-linux/issues/264#issuecomment-402575483):
  # psql --dbname=postgres://foo:bar@$(ip route|awk '/default/ { print $3 }'):5432/dev_db

  # postgresql = {
  #   enable = true;

  #   extraConfig = ''
  #     listen_addresses = '*'
  #   '';

  #   authentication = ''
  #     # Allow login as user foo from any ip (0.0.0.0/0) by encrypted password (md5)
  #     host all foo 0.0.0.0/0 md5
  #   '';

  #   package = pkgs.postgresql100;

  #   initialScript = pkgs.writeText "postgres-initScript" ''
  #     CREATE ROLE foo WITH LOGIN PASSWORD 'bar' CREATEDB;
  #     CREATE DATABASE dev_db;
  #     GRANT ALL PRIVILEGES ON DATABASE dev_db TO foo;
  #   '';
  # };

  openssh.enable = true;
  xbanish.enable = true;
  compton.enable = true;

  gnome3.gnome-documents.enable = false;
  gnome3.gnome-online-accounts.enable = false;
  gnome3.gnome-terminal-server.enable = false;
  gnome3.gnome-user-share.enable = false;
  gnome3.tracker.enable = false;
  gnome3.evolution-data-server.enable = lib.mkForce false;
  packagekit.enable = false;
  gnome3.gnome-keyring.enable = lib.mkForce false;
  gnome3.seahorse.enable = false;
  gnome3.tracker-miners.enable = false;
  geoclue2.enable = false;
  dleyna-renderer.enable = false;
  dleyna-server.enable = false;

  redshift = {
    enable = true;
    latitude = "47.517201";
    longitude = "35.859375";
    temperature.night = 2500;
    brightness.night = "0.5";
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
    libinput.enable = true;

    dpi = 96;
    deviceSection = ''
      Option "DPI" "96 x 96"
    '';

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
          user = "srghma";
        };
      };

      sessionCommands = ''
        ${xorg.xkbcomp}/bin/xkbcomp ${layout} $DISPLAY &
        ${copyq}/bin/copyq &
      '';
    };
  };

  # hostapd = {
  #   enable        = true;
  #   wpaPassphrase = "passphrase";
  #   ssid          = "srghma-nixos";
  #   interface     = "wlp3s0";
  # };
}
