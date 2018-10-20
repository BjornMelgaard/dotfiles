{ pkgs, ... }:

with pkgs;

rec {
  etc."resolvconf.conf".text = ''
    name_servers_append='8.8.8.8'
  '';

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

    (import <nixpkgs-unstable> {}).pkgs.nodejs-10_x

    python

    # stack
    # haskellPackages.intero

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

    # safeeyes
    cmus
    hubstaff
    screen
    abiword

    # pass
    # qtpass

    # My packages
    dunsted-volume
    randomize_background
    kb-light
    switch_touchpad
    tmuxx
    umsf
    nixfromnpm
    fix_github_https_repo
    linted-git-commit

    xmind
    jq
    (import <nixpkgs-unstable> {}).pkgs.stack2nix

    (import <nixpkgs-unstable> {}).pkgs.idris
  ];

  # TODO
  # variables."GTK2_RC_FILES" =
  #   "${pkgs.gnome3.gnome_themes_standard}/share/themes/Adwaita/gtk-2.0/gtkrc";
}
