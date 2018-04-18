{ config, pkgs, lib, ... }:

let r = {
  imports = [
    ./hardware-configuration.nix
    ./hardware-configuration-override.nix
    ./hardware-programs.nix
    /home/bjorn/projects/nixpkgs/nixos/modules/services/misc/safeeyes.nix
  ];

  environment = import ./environment { inherit pkgs; };
  services    = import ./services    { inherit pkgs; };
  fonts       = import ./fonts       { inherit pkgs; };
  nixpkgs     = import ./nixpkgs     { inherit pkgs config; };
  users       = import ./users       { inherit pkgs; };
  systemd     = import ./systemd     { inherit pkgs config; };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      ohMyZsh.enable = true;
    };
    command-not-found.enable = true;
  };

  networking = {
    hostName = "machine";
    networkmanager.enable = true;

    # firewall = {
    #   enable = true;
    #   allowPing = false;
    #   allowedTCPPorts = [ 35732 ];
    # };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Kiev";
  nix.useSandbox = true;
  nix.extraOptions = ''
    auto-optimise-store = true
  '';
  nix.gc.automatic = false;

  # use unstable
  # nix.package = pkgs.nixUnstable;

  virtualisation.docker.enable = true;
  # virtualisation.virtualbox.host.enable = true;

  system.stateVersion = "18.03";
};

in
builtins.seq (lib.debug.showVal config.nixpkgs.allowUnfree) r
