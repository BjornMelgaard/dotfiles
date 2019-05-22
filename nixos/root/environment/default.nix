{ pkgs, ... }:

with pkgs;

let
  nixpkgs-unstable-src = fetchTarball https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz;

  nixpkgsUnstable = import nixpkgs-unstable-src { config = { allowUnfree = true; }; };
in

rec {
  systemPackages = [
    google-chrome
    zip
    unzip
    htop
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
    inkscape

    docker_compose
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
    # simplescreenrecorder
    # kazam

    # vagrant
    # virtualbox

    # fzf
    # bfg-repo-cleaner # removes passwords from git repo

    nox
    nix-prefetch-git
    # gimp
    # imagemagick

    safeeyes
    # cmus
    hubstaff
    # screen
    # abiword

    # pass
    # qtpass

    # nixfromnpm

    # My packages
    dunsted-volume
    randomize_background
    kb-light
    switch_touchpad
    tmuxx
    # umsf
    fix_github_https_repo
    fix_gitlab_https_repo

    # xmind
    jq
    nixpkgsUnstable.pkgs.rubocop

    hie-nix.hies
    auto-hie-wrapper
    # nixpkgsUnstable.pkgs.stack
    stack

    # haskellPackages.intero
    # stack2nix
    # nixpkgsUnstable.pkgs.cabal2nix

    # nixpkgsUnstable.pkgs.idris

    # sql linters parsers for vim
    # python36Packages.sqlparse
    # sqlint
    # pgFormatter
    # python36Packages.syncthing-gtk
    # arion

    # for vim
    # haskellPackages.hindent
    # haskellPackages.stylish-haskell
    # haskellPackages.brittany
    # haskellPackages.Agda
    # nixpkgsUnstable.pkgs.steam

    # pgmodeler
  ];

  variables = {
    EDITOR = "nvim";
  };

  etc."resolvconf.conf".text = ''
    name_servers='8.8.8.8'
  '';
}
