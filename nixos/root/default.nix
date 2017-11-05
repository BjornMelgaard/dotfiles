# This is the root configuration file
#
# import it in your `/etc/nixos/configuration.nix` like this:
# ```
# let
#   dotfilesDir="/home/bjorn/.config/dotfiles";
# in
#   import "${dotfilesDir}/root/home/default.nix"
# ```

# TODO: take out path to dotfiles in (maybe in root conf)

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
  };

  system.stateVersion = "17.09";
}
