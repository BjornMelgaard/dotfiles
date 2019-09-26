{ pkgs, ... }:

with pkgs;

let
  # sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
  # nixpkgs-unstable-src = fetchTarball https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz;
  nixpkgs-unstable-src = <nixpkgs-unstable>;

  nixpkgsUnstable = import nixpkgs-unstable-src { config = { allowUnfree = true; }; };
in

rec {
  systemPackages = [
    nixpkgsUnstable.pkgs.google-chrome
    # nixpkgsUnstable.pkgs.chromium
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
    termite
    neovim
    tmux
    nixpkgsUnstable.pkgs.vscode
    # nixpkgsUnstable.pkgs.nix

    ## development
    git
    gitAndTools.diff-so-fancy
    gitAndTools.git-crypt
    meld

    nixpkgsUnstable.pkgs.nodejs-10_x

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
    # firefox
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

    mypkgs.all-hies.versions.ghc865

    # nixpkgsUnstable.pkgs.hlint
    # mypkgs.auto-hie-wrapper
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
    nixpkgsUnstable.pkgs.texworks
    # nixpkgsUnstable.pkgs.lex

    (
      texlive.combine {
        # tabularx is not available
        inherit (pkgs.texlive) scheme-small cleveref latexmk bibtex algorithms cm-super
        csvsimple subfigure  glossaries collection-latexextra;
      }
    )
  ];

  variables = {
    EDITOR = "nvim";
  };

  # etc."resolvconf.conf".text = ''
  #   name_servers='8.8.8.8'
  # '';
}
