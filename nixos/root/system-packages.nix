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
    dunsted-volume
    # notify-desktop
    netcat-openbsd # nc -U /var/run/acpid.socket
    xorg.xbacklight
  ];
}
