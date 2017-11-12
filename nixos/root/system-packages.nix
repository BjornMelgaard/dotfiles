{ pkgs, ... }:

with pkgs;

{
  environment.systemPackages = [
    ## system
    google-chrome
    zip
    unzip
    htop
    nix-repl
    ag
    ntfs3g

    # i3
    pavucontrol
    conky

    # dunst
    copyq
    rofi
    pasystray
    scrot
    anki
    xarchiver

    # set themes with gconf
    numix-sx-gtk-theme
    numix-icon-theme-circle
    numix-icon-theme
    vanilla-dmz

    ## misc
    transmission
    feh
    mpv
    xclip
    atool
    wget
    gnupg # encryption key management
    thunderbird
    psmisc # killall and others

    ranger
    termite
    neovim
    tmux
    vscode

    ## development
    git
    gitAndTools.diff-so-fancy
    meld

    docker

    nodejs
    yarn

    python

    stack
    haskellPackages.ghc

    ruby

    # notify-desktop
    netcat-openbsd # nc -U /var/run/acpid.socket
    xorg.xbacklight
    unar unrar
    automake autoconf gnumake gcc

    lingualeo2anki
    dunsted-volume
    # haskellPackages.hfmt
  ];

  nixpkgs.config.packageOverrides = super: {
    dunsted-volume = callPackage (fetchFromGitHub {
      owner = "BjornMelgaard";
      repo = "dunsted-volume";
      rev = "44bf00f1e39dfcb77761bca4836282a6f7516dd4";
      sha256 = "19ckjpmm3zki54xgnapg1j4c1wk7iv50zgd39n80yp2srsa2s0ka";
    }) {};

    lingualeo2anki = callPackage (fetchFromGitHub {
      owner = "BjornMelgaard";
      repo = "lingualeo2anki";
      rev = "81faa0e198fcb167369416c3b4657544ce84c7d4";
      sha256 = "1pi46zsbjw2zkd29d95cpy2llmc5djpmaa7cmb1v4bf7gxb6ihgb";
    }) {};

    # lingualeo2anki = callPackage /home/bjorn/projects/lingualeo2anki {};
  };
}
