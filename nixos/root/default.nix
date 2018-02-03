{ config, pkgs, xorg, ... }:

{
  imports =
    [
    ./hardware-configuration.nix
    ./hardware-configuration-override.nix
    ./system.nix
    ./fonts.nix
    ./desktop.nix
    ./system-packages.nix
    ];

  environment = {
    variables = {
      EDITOR="nvim";
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

  system.stateVersion = "17.09";
}
