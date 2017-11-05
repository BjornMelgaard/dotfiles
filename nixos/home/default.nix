# This is the user configuration file,
# use it with https://github.com/rycee/home-manager
#
# import it in your `$HOME/.config/nixpkgs/home.nix` like this:
# ```
# let
#   dotfilesDir=/home/bjorn/.config/dotfiles;
# in
#   import "${dotfilesDir}/nixos/home/default.nix"
# ```

{ pkgs, ... }:

# TODO: take out path to dotfiles (maybe in root conf)
# TODO: link only some files in nvim to exlude all rubbish

let
  dotfilesDir=/home/bjorn/.config/dotfiles;
in {
  programs.home-manager = {
    enable = true;
    path = "https://github.com/rycee/home-manager/archive/release-17.09.tar.gz";
  };

  home.file.".zshenv".text = ''
    export PATH="$PATH:${dotfilesDir}/bin"
  '';

  home.file.".Xresources".text = ''
    ${builtins.readFile "${dotfilesDir}/Xresources/colorscheme"}
    ${builtins.readFile "${dotfilesDir}/Xresources/rofi"}
  '';

  home.file.".zshrc".source     = "${dotfilesDir}/zshrc";
  home.file.".tmux.conf".source = "${dotfilesDir}/tmux.conf";
  home.file.".i3/config".source = "${dotfilesDir}/i3/config";

  home.file.".config/nvim".source = "${dotfilesDir}/nvim";

  home.file.".config/ranger/commands.py".source   = "${dotfilesDir}/ranger/commands.py";
  home.file.".config/ranger/history".source       = "${dotfilesDir}/ranger/history";
  home.file.".config/ranger/rc.conf".source       = "${dotfilesDir}/ranger/rc.conf";
  home.file.".config/ranger/scope.sh".source      = "${dotfilesDir}/ranger/scope.sh";

  home.file.".stack/config.yaml".source           = "${dotfilesDir}/stack-global.yaml";
  home.file.".config/dunst/dunstrc".source        = "${dotfilesDir}/dunstrc";
  home.file.".gitconfig".source                   = "${dotfilesDir}/gitconfig";
  home.file.".gitignore_global".source            = "${dotfilesDir}/gitignore_global";
  home.file.".gtkrc-2.0".source                   = "${dotfilesDir}/gtkrc-2.0";
  home.file.".config/gtk-3.0/settings.ini".source = "${dotfilesDir}/gtk-3.0-settings.ini";
  home.file.".ctags".source                       = "${dotfilesDir}/ctags";
  home.file.".ncmpcpp/bindings".source            = "${dotfilesDir}/ncmpcpp_bindings";
  home.file.".config/termite".source              = "${dotfilesDir}/termite";
  home.file.".commitlintrc.yml".source            = "${dotfilesDir}/commitlintrc.yml";
}