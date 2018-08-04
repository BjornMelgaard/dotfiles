{ options, config, pkgs, lib, ... }:

{
  imports = [
    ../modules/cachix.nix

    ./hardware-configuration.nix
    ./hardware-configuration-override.nix
    ./hardware-programs.nix
    ./systemd/disable-touchpad.nix
  ];

  environment = import ./environment { inherit pkgs; };
  services    = import ./services    { inherit pkgs; };
  fonts       = import ./fonts       { inherit pkgs; };
  nixpkgs     = import ./nixpkgs     { };
  users       = import ./users       { inherit pkgs; };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  programs = {
    java.enable = true;

    cachix = {
      enable = true;
      cachixSigningKey = builtins.readFile ../../secrets/cachixSigningKey.txt;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;

      interactiveShellInit = ''
        DEFAULT_USER="srghma"

        autoload -U zmv

        # npm/yarn
        export PATH="$HOME/.node_modules/bin:$PATH"

        # gem
        GEM_HOME=$HOME/.gem/ruby/${pkgs.ruby_2_4.version.libDir}
        GEM_PATH=$GEM_HOME
        export PATH="$GEM_HOME/bin:$PATH"
      '';

      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          ## appearence
          "colorize"
          "compleat"
          "common-aliases"
          # zsh-autosuggestions
          # zsh-completions

          ## editing
          "vi-mode"

          ## navigation
          "history-substring-search"
          "dircycle"
          "dirpersist"
          "pj"
          "zsh-navigation-tools"

          ## programs
          # tmux
          "git"

          ## nixos
          # NOTE: nix-zsh-completions already installed via `programs.zsh.enableCompletion = true`
          "systemd"
          "sudo"

          ## ruby
          "bundler"
          "ruby"
          "rails"
          "gem"
          # rvm
          # rake-fast

          ## haskell
          # stack

          ## docker
          "docker"
          "docker-compose"

          ## js
          # yarn
        ];
      };
    };

    command-not-found.enable = true;
  };

  networking = {
    hostName = "machine";
    networkmanager.enable = true;

    firewall = {
      # for libvirtd (https://nixos.org/nixops/manual/#idm140737318329504)
      # checkReversePath = false;

      enable = true;
      allowPing = false;

      # allowedTCPPorts = [ 35732 ];
    };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Kiev";

  nix = {
    useSandbox = true;

    extraOptions = ''
      auto-optimise-store = true
    '';

    gc.automatic = true;

    binaryCaches = [
      "https://cache.nixos.org"
      "https://cachix.cachix.org"
      "https://srghma.cachix.org"
    ];

    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "srghma.cachix.org-1:EUHKjTh/WKs49hFtw6bwDE9oQLeX5afml0cAKc97MbI="
    ];

    trustedUsers = [ "root" "srghma" ];
  };

  # use unstable
  # nix.package = pkgs.nixUnstable;

  virtualisation.docker.enable = true;
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.libvirtd.enable = true;

  system.stateVersion = "18.03";
}
