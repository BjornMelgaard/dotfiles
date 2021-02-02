# Support for custom keyboards:
{ config, pkgs, lib, ... }:

let

  username = config.tilde.username;
  cfg = config.tilde.workstation.disable_main_keyboard;

  package = pkgs.stdenvNoCC.mkDerivation {
    name = "keyboard-script";
    phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
    src = ./.;

    installPhase = ''
      mkdir -p $out/bin
      export nixpath=${pkgs.xorg.setxkbmap}/bin:${pkgs.xorg.xkbcomp}/bin:${pkgs.xorg.xinput}/bin:${pkgs.gnugrep}/bin:${pkgs.coreutils}/bin
      substituteAll ${./disable-main-keyboard.sh} $out/bin/keyboard.sh
      chmod 0555 $out/bin/keyboard.sh
    '';
  };

  # script = pkgs.writeShellScript "keyboard-setup" ''
  #   ${package}/bin/keyboard.sh "$@"
  # '';

  deviceOpts = {
    options = {
      vendor = lib.mkOption {
        type = lib.types.str;
        example = "03EB";
        description = "USB vendor ID provided by lsusb";
      };

      product = lib.mkOption {
        type = lib.types.str;
        example = "2FEF";
        description = "USB product ID provided by lsusb";
      };
    };
  };

in

{
  options.tilde.username = lib.mkOption {
    type = lib.types.str;
    default = "srghma";
    description = "The username to use.";
  };

  options.tilde.workstation.disable_main_keyboard = {
    enable = lib.mkEnableOption "Custom keyboard scripts";

    devices = lib.mkOption {
      type = lib.types.listOf (lib.types.submodule deviceOpts);
      description = "List of keyboard devices";
      default = [
        # { vendor = "feed"; product = "3060"; } # Dactyl Manuform Mini
        { vendor = "feed"; product = "0000"; } # Redox
      ];
    };
  };

  config = lib.mkIf cfg.enable {
    services.udev.extraRules =
      lib.concatMapStringsSep "\n"
        (kbd:
          let
            common = [
              ''ATTRS{idVendor}=="${kbd.vendor}"''
              ''ATTRS{idProduct}=="${kbd.product}"''
              ''TAG+="uaccess"''
              ''RUN{builtin}+="uaccess"''
              ''OWNER="${username}"''
            ];

            add = [
              ''SUBSYSTEMS=="usb"''
              ''ACTION=="add"''
            ] ++ common ++ [
              ''RUN+="${package}/bin/keyboard.sh add"''
            ];

            remove = [
              ''SUBSYSTEMS=="usb"''
              ''ACTION=="remove"''
            ] ++ common ++ [
              ''RUN+="${package}/bin/keyboard.sh rm"''
            ];
          in
          lib.concatStringsSep "," add + "\n" + lib.concatStringsSep "," remove)
        cfg.devices;
  };
}
