{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.cachix;

in
{
  ###### interface

  options = {
    programs.cachix = {
      enable = mkEnableOption "cachix";

      cachixSigningKey = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
          Global CACHIX_SIGNING_KEY environment variable
        '';
      };
    };
  };

  ###### implementation

  config = mkIf cfg.enable (mkMerge [
    {
      environment.systemPackages = [ pkgs.cachix ];
    }

    (mkIf (cfg.cachixSigningKey != null) {
      environment.variables.CACHIX_SIGNING_KEY = cfg.cachixSigningKey;
    })
  ]);
}
