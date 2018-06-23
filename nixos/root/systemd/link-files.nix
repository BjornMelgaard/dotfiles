{ config, pkgs }:

with pkgs;

rec {
  #user.services.link-files = {
  #  description = "Link files";

  #  wantedBy = [ "graphical-session.target" ];
  #  partOf = [ "graphical-session.target" ];

  #  serviceConfig = {
  #    Type = "oneshot";

  #    ExecStart = pkgs.writeScript "link-files" ''
  #      #! ${pkgs.stdenv.shell} -el

  #      TOUCHPAD_NAME="touchpad"
  #      TOUCHPAD_ID=$(echo $(xinput list) | sed -n "s/.*$TOUCHPAD_NAME.*id=\([0-9]\+\).*$/\1/gIp")

  #      if [ -n "$TOUCHPAD_ID" ]; then
  #        ${xorg.xinput}/bin/xinput --disable "$TOUCHPAD_ID"
  #      fi
  #    '';
  #  };
  #};
}
