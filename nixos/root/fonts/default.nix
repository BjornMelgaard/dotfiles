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
    # nix-prefetch-url --type sha256 --unpack --name source file:///home/$USER/Downloads/nerd-fonts-2.0.0.tar.gz 09i467hyskvzj2wn5sj6shvc9pb0a0rx5iknjkkkbg1ng3bla7nm
    # (find expected hash https://github.com/NixOS/nixpkgs/blob/92a047a6c4d46a222e9c323ea85882d0a7a13af8/pkgs/data/fonts/nerdfonts/default.nix#L6-L11)
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
