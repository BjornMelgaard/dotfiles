{ config, pkgs }:

with pkgs;

let
  nixpkgs-working-hubstaff = import ../lib/nixpkgs-working-hubstaff.nix;
in

rec {
  variables = {
    EDITOR="nvim";
  };

  systemPackages = [
    # system
    google-chrome
    zip
    unzip
    htop
    nix-repl
    ag
    ntfs3g
    alsaUtils

    pavucontrol
    conky

    dunst
    copyq
    rofi
    pasystray
    scrot
    anki
    xarchiver

    # XXX: set themes with gconf
    numix-sx-gtk-theme
    numix-icon-theme-circle
    numix-icon-theme
    vanilla-dmz

    ## misc
    transmission_gtk
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
    gitAndTools.git-crypt
    meld

    docker

    nodejs-8_x
    yarn

    python

    stack
    ruby_2_4

    transmission

    netcat-openbsd # nc -U /var/run/acpid.socket
    lsof
    xorg.xbacklight
    openssl

    unar
    unrar

    automake
    autoconf
    gnumake
    gcc
    inkscape

    docker_compose
    mkpasswd

    # android-studio
    ctags
    filezilla
    # firefox
    vlc
    asciinema
    tree
    youtube-dl
    tigervnc

    # screencast
    # gtk-recordmydesktop
    kdenlive
    simplescreenrecorder
    # kazam

    # vagrant
    # virtualbox

    fzf
    bfg-repo-cleaner # removes passwords from git repo

    nox
    nix-prefetch-git
    gimp
    imagemagick

    # My remote packages
    dunsted-volume
    randomize_background
    kb-light

    safeeyes
    cmus
    nixpkgs-working-hubstaff.hubstaff
    screen
    abiword
  ];
}
