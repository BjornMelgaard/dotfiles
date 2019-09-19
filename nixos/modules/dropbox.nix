# stolen from https://github.com/claymager/nix-dots/blob/master/modules/services/dropbox.nix

{ config, pkgs, lib, ... }:

with lib;
{
  options.services.dropbox = {
    enable = mkEnableOption "dropbox service";
  };


  config = mkIf config.services.dropbox.enable {

    networking.firewall = {
      allowedTCPPorts = [ 17500 ];
      allowedUDPPorts = [ 17500 ];
    };

    environment.systemPackages = [ pkgs.dropbox-cli ];

    systemd.user.services.dropbox = {
      description = "Dropbox";
      wantedBy = [ "graphical-session.target" ];
      environment = {
        QT_PLUGIN_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtPluginPrefix;
        QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
        HOME = "%h/.dropbox";
      };

      serviceConfig = {
        ExecStart = "${pkgs.dropbox}/bin/dropbox start";
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
        KillMode = "control-group"; # upstream recommends process
        Restart = "on-failure";
        PrivateTmp = true;
        ProtectSystem = "full";
        Nice = 10;
      };
    };
  };
}
