{ pkgs, ... }:

rec {
  enableCoreFonts = true;
  enableFontDir = true;
  enableGhostscriptFonts = true;

  fonts = with pkgs; [
    ubuntu_font_family
    powerline-fonts
    font-awesome-ttf
    source-code-pro
    noto-fonts
    emojione

    # the font package loads very slow (https://github.com/NixOS/nixpkgs/issues/47921)
    # to prevent error - download for github manually from
    # https://github.com/ryanoasis/nerd-fonts/archive/2.0.0.tar.gz
    # and then
    # nix-prefetch-url file:///home/$USER/Downloads/nerd-fonts-2.0.0.tar.gz
    # nerdfonts
  ];

  fontconfig = {
    # dpi = 80;
    defaultFonts = {
      monospace = [
        "DejaVu Sans Mono"
        "Noto Mono"
      ];
      sansSerif = [
        "Ubuntu"
        "DejaVu Sans"
        "Noto Sans"
      ];
      serif = [
        "PT Serif"
        "Liberation Serif"
        "Noto Serif"
      ];
    };
  };
}
