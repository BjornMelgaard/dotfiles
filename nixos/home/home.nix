# This is the user configuration file,
# use it with https://github.com/rycee/home-manager
#
# import it in your `$HOME/.config/nixpkgs/home.nix` like this:
# ```
# let
#   dotfilesDir=/home/bjorn/.config/dotfiles;
# in
#   import "${dotfilesDir}/nixos/home/home.nix"
# ```

{ pkgs, ... }:

let
  dotfilesDir=/home/bjorn/.config/dotfiles;
in {
  programs.home-manager = {
    enable = true;
    # path = "$HOME/projects/home-manager";
    path = "https://github.com/rycee/home-manager/archive/master.tar.gz";
  };

  home.file.".Xresources".text = ''
    ${builtins.readFile "${dotfilesDir}/Xresources/colorscheme"}
    ${builtins.readFile "${dotfilesDir}/Xresources/rofi"}
  '';

  services.dunst = {
    enable = true;
    iconTheme = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita";
    };
    settings = {
      global = {
        geometry = "300x5+30+20";
        transparency = 10;
        frame_color = "#eceff1";
        font = "Droid Sans 9";
        icon_position = "left";
        padding = 8;
        horizontal_padding = 8;
      };
      urgency_normal = {
        background = "#37474f";
        foreground = "#eceff1";
        timeout = 10;
      };
    };
  };
}
