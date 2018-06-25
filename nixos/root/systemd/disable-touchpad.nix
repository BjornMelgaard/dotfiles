{ pkgs, ... }:

with pkgs;

{
  systemd.user.services.disable-touchpad = {
    description = "Disable touchpad";

    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "oneshot";
      # RemainAfterExit = "yes";

      ExecStart = pkgs.writeScript "disable-touchpad" ''
        #! ${pkgs.stdenv.shell} -el

        TOUCHPAD_NAME="touchpad"
        TOUCHPAD_ID=$(echo "$(${xorg.xinput}/bin/xinput list)" | sed -n "s/.*$TOUCHPAD_NAME.*id=\([0-9]\+\).*$/\1/gIp")

        if [ -n "$TOUCHPAD_ID" ]; then
          ${xorg.xinput}/bin/xinput --disable "$TOUCHPAD_ID"
        fi
      '';
    };
  };
}
