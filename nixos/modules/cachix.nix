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
          Global (will be available to user users on machine) CACHIX_SIGNING_KEY environment variable.
          Should be kept in secret.
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
