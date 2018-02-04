{ config, pkgs, xorg, ... }:

{
  imports =
    [
    ./hardware-configuration.nix
    ./hardware-configuration-override.nix
    ./system.nix
    ./hardware-programs.nix
    ./fonts.nix
    ./desktop.nix
    ./system-packages.nix
    ./programs.nix
    ];

  environment = {
    variables = {
      EDITOR="nvim";
    };
  };

  system.stateVersion = "17.09";
}
