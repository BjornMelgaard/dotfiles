{ config, pkgs }:

# ${pkgs.xorg.xinput}/bin/xinput --disable 'ELAN1300:00 04F3:3057 Touchpad'
# ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${dotfilesDir}/layouts/en_ru $DISPLAY

with pkgs;
with (import /etc/nixos/metaconfiguration.nix);

let
  touchpadId = "ELAN1300:00 04F3:3057 Touchpad";
in

rec {
  user.services.safeeyes = {
    description = "Safeeyes";

    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = ''
        ${safeeyes}/bin/safeeyes
      '';
      RestartSec = 3;
      Restart = "always";
    };
  };

  # TODO: QtFatal: This application failed to start because it could not find or load the Qt platform
  # user.services.copyq = {
  #   description = "Copyq";

  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];

  #   serviceConfig = {
  #     ExecStart = ''
  #       ${copyq}/bin/copyq
  #     '';
  #     RestartSec = 3;
  #     Restart = "always";
  #   };
  # };

  user.services.disable-touchpad = {
    description = "Disable touchpad";

    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = ''
        ${xorg.xinput}/bin/xinput --disable '${touchpadId}'
      '';
      RestartSec = 3;
      Restart = "always";
    };
  };

  # TODO: invalid command, maybe because of -I
  #services.custom-layout = {
  #  description = "Custom layout";
  #  serviceConfig = {
  #    Type = "simple";
  #    User = userName;
  #    ExecStart = writeScript "custom-layout" ''
  #        #! ${bash}/bin/bash
  #        set -xe
  #        ${xorg.xkbcomp}/bin/xkbcomp -I${layout} - :0.0
  #      '';
  #    RemainAfterExit = "yes";
  #    RestartSec = 3;
  #    Restart = "always";
  #  };
  #  environment = { DISPLAY = ":${toString config.services.xserver.display}"; };
  #  wantedBy = [ "display-manager.service" ];
  #  after = [ "display-manager.service" ];
  #};
}
