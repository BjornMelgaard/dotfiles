{ pkgs, ... }:

with pkgs;
with (callPackage ./lib {});

{
  environment.systemPackages = [
    # system
    google-chrome
    zip
    unzip
    htop
    nix-repl
    ag
    ntfs3g

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

    unar
    unrar

    automake
    autoconf
    gnumake
    gcc

    python3Packages.docker_compose
    mkpasswd

    # android-studio
    ctags
    filezilla
    firefox
    gtk-recordmydesktop
    vlc
    asciinema
    tree
    youtube-dl

    # vagrant
    # virtualbox

    fzf
    bfg-repo-cleaner # removes passwords from git repo

    nox
    nix-prefetch-git
    gimp

    # My remote packages
    dunsted-volume
    randomize_background
    kb-light
  ];

  nixpkgs.config.packageOverrides = super: {
    # My remote packages

    # update command example: nix-prefetch-git https://github.com/BjornMelgaard/dunsted-volume > $DOTFILES/nixos/root/nix-prefetch-git-revisions/dunsted-volume.json
    dunsted-volume = callPackage (fetchFromGitHub (revisionDataFromFile ./nix-prefetch-git-revisions/dunsted-volume.json)) {};

    # update command example: nix-prefetch-git https://github.com/BjornMelgaard/randomize_background > $DOTFILES/nixos/root/nix-prefetch-git-revisions/randomize_background.json
    randomize_background = callPackage (fetchFromGitHub (revisionDataFromFile ./nix-prefetch-git-revisions/randomize_background.json)) {};

    # update command example: nix-prefetch-git https://github.com/BjornMelgaard/kb-light > $DOTFILES/nixos/root/nix-prefetch-git-revisions/kb-light.json
    kb-light = callPackage (fetchFromGitHub (revisionDataFromFile ./nix-prefetch-git-revisions/kb-light.json)) {};
  };
}
