{ config, lib, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      ohMyZsh.enable = true;
    };
    command-not-found.enable = true;
  };

  virtualisation.docker.enable = true;
  # virtualisation.virtualbox.host.enable = true;
}
