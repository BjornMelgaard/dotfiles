{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    dunst
    copyq
    rofi
    pasystray
    scrot
    anki
    xarchiver

    numix-sx-gtk-theme
    numix-icon-theme-circle
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
  ];
}
