{ config, lib, pkgs, ... }:

{
  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      powerline-fonts
      font-awesome-ttf
      source-code-pro
      nerdfonts
      # hasklig
      noto-fonts
      emojione
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
  };
}
