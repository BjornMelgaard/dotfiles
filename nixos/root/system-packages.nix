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
    gnupg
    thunderbird
    psmisc

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
    ruby_2_4

    transmission

    netcat-openbsd # nc -U /var/run/acpid.socket
    lsof
    xorg.xbacklight
    unar unrar
    automake autoconf gnumake gcc

    lingualeo2anki
    dunsted-volume
    python3Packages.docker_compose

    android-studio
    ctags
    filezilla
    firefox
    gtk-recordmydesktop
    vlc
    asciinema
    tree
    youtube-dl
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
      rev = "3f077f6afdce9578868e2e9b26149cfa10d5458f";
      sha256 = "187jgfr55qq169aws7jcr4qnfs7hy0vnsl87f6dlxaclk9yixg8d";
    }) {};

    # haskellPackages = super.haskellPackages.override {
    #   overrides = self: super_: {
    #     "hfmt" = super_."hfmt".overrideDerivation (attrs: rec {
    #       src = super.fetchFromGitHub {
    #         owner = "danstiner";
    #         repo = "hfmt";
    #         rev = "62fe625e1824f9671a2f462856165dfbf6627ef8";
    #         sha256 = "0hpfgjiwr7dbd6b30szvs8mdrpswvvgncrp8mb1y1avza8z1jdid";
    #       };
    #     });
    #   };
    # };

  };
}
