{ pkgs, ... }:

with pkgs;

rec {
  systemPackages = [
    nixpkgsUnstable.pkgs.google-chrome-beta
    # nixpkgsUnstable.pkgs.chromium
    libreoffice
    zip
    unzip
    htop
    ag
    ntfs3g
    alsaUtils

    nixpkgsUnstable.pkgs.okular

    pavucontrol
    conky

    dunst
    copyq
    rofi
    pasystray
    scrot
    # anki
    xarchiver

    ## misc
    transmission_gtk
    feh
    mpv
    xclip
    atool
    wget
    gnupg
    thunderbird
    # psmisc

    ranger
    # nixpkgsMaster.pkgs.termite
    nixpkgsMaster.pkgs.kitty
    neovim
    tmux
    nixpkgsUnstable.pkgs.vscode
    # nixpkgsUnstable.pkgs.nix

    ## development
    git
    gitAndTools.diff-so-fancy
    gitAndTools.git-crypt
    meld

    # nixpkgsUnstable.pkgs.mplayer

    nixpkgsUnstable.pkgs.nodejs-13_x

    # netcat-openbsd # nc -U /var/run/acpid.socket
    lsof
    openssl

    # xorg.xbacklight
    acpilight

    unar
    unrar

    automake
    autoconf
    # nixpkgsUnstable.autoconf
    gnumake
    gcc
    # inkscape

    nixpkgsUnstable.pkgs.docker_compose
    # mkpasswd

    # android-studio
    ctags
    # filezilla
    firefox
    asciinema
    # tree
    # youtube-dl
    tigervnc

    # screencast
    # gtk-recordmydesktop
    # kdenlive
    simplescreenrecorder
    # kazam

    # vagrant
    # virtualbox

    # fzf
    # bfg-repo-cleaner # removes passwords from git repo

    # nox
    nix-prefetch-git
    gimp
    # imagemagick

    # safeeyes
    # cmus
    mypkgs.hubstaff
    # screen
    # abiword

    # pass
    # qtpass

    # mypkgs.nixfromnpm

    # My packages
    mypkgs.dunsted-volume
    mypkgs.randomize_background
    mypkgs.kb-light
    mypkgs.switch_touchpad
    mypkgs.tmuxx
    # mypkgs.umsf
    mypkgs.fix-github-https-repo

    # xmind
    jq
    nixpkgsUnstable.pkgs.rubocop

    mypkgs.all-hies.latest # mypkgs.all-hies.unstable.latest

    # nixpkgsUnstable.pkgs.hlint
    # mypkgs.auto-hie-wrapper # use mypkgs.all-hies.unstable.combined ..
    nixpkgsUnstable.pkgs.stack
    # stack

    # haskellPackages.intero
    # stack2nix
    # nixpkgsUnstable.pkgs.cabal2nix

    # nixpkgsUnstable.pkgs.idris

    # sql linters parsers for vim
    # python36Packages.sqlparse
    # sqlint
    # mypkgs.pgFormatter
    # python36Packages.syncthing-gtk
    # mypkgs.arion

    (nixpkgsUnstable.python37.withPackages (ps: with ps; [ pynvim ])) # for denite https://github.com/Shougo/denite.nvim/issues/456

    # for vim
    # nixpkgsUnstable.haskellPackages.hindent
    # nixpkgsUnstable.haskellPackages.stylish-haskell
    # nixpkgsUnstable.haskellPackages.brittany
    # (
    #   let
    #     # oldPkgs = import (fetchTarball https://nixos.org/channels/nixos-18.09/nixexprs.tar.xz) {};
    #     oldPkgs = import <nixos1803> {};
    #   in oldPkgs.haskellPackages.brittany
    # )
    # haskellPackages.Agda
    # nixpkgsUnstable.pkgs.steam

    # mypkgs.pgmodeler
    # mypkgs.obelisk.command

    # Research
    nixpkgsUnstable.pkgs.zotero
    google-drive-ocamlfuse

    dropbox-cli

    # ID kaart
    nixpkgsUnstable.pkgs.chrome-token-signing
    nixpkgsUnstable.pkgs.qdigidoc

    nixpkgsUnstable.pkgs.gfxtablet
    nixpkgsUnstable.pkgs.patchelf
    # nixpkgsUnstable.pkgs.write_stylus
    # xournal
    # nixpkgsUnstable.pkgs.texworks
    # nixpkgsUnstable.pkgs.lex

    # (
    #   texlive.combine {
    #     # tabularx is not available
    #     inherit (pkgs.texlive) scheme-small cleveref latexmk bibtex algorithms cm-super
    #     csvsimple subfigure  glossaries collection-latexextra;
    #   }
    # )

    ruby_2_6

    # nixpkgsUnstable.pkgs.gnome3.evolution

    # nixpkgsUnstable.pkgs.ib-tws
    # nixpkgsUnstable.pkgs.ib-controller
    nixpkgsUnstable.pkgs.solargraph

    mypkgs.easy-purescript-nix-automatic.spago
    mypkgs.easy-purescript-nix-automatic.purs
    mypkgs.easy-purescript-nix-automatic.purty # find ./packages/client/src -name "*.purs" -exec purty --write {} \;
  ];

  variables = {
    EDITOR = "nvim";
  };

  etc."resolvconf.conf".text = ''
    name_servers='8.8.8.8'
  '';
}
