{ options, config, pkgs, lib, ... }@args:

{
  imports = [
    ../modules/cachix.nix

    ./hardware-configuration.nix
    ./hardware-configuration-override.nix
    ./hardware-programs.nix
    ./systemd/disable-touchpad.nix
    ./users
  ];

  environment = import ./environment args;
  services    = import ./services    args;
  fonts       = import ./fonts       args;

  nixpkgs     = {
    config = {
      allowUnfree = true;
    };

    overlays = [
      (import ../pkgs/overlay.nix)
      (import ../utils/overlay.nix)
    ];
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  programs = {
    # java.enable = true;

    # use gnupg-agent instead ssh-agent
    # my ssh keys are password protected
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    cachix = {
      enable = true;
      cachixSigningKey = builtins.readFile ../../secrets/cachixSigningKey.txt;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;

      interactiveShellInit = ''
        ${builtins.readFile ./zsh/movements.sh}

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
    hostId = "210b80eb"; # generated with `head -c 8 /etc/machine-id`

    networkmanager = {
      enable = true;
    };

    firewall = {
      # for libvirtd (https://nixos.org/nixops/manual/#idm140737318329504)
      # checkReversePath = false;

      enable = true;
      allowPing = false;

      # allowedTCPPorts = [ 5432 ];
    };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Kiev";

  nix = {
    useSandbox = false;

    # TODO: wait https://github.com/NixOS/nixpkgs/pull/44880
    # maxJobs = "auto";

    # 0 means to use all available cores
    buildCores = 0;

    # max-jobs is about the number of derivations that Nix will build in parallel, while cores is about parallelism inside a derivation, e.g. what make -j will use

    extraOptions = ''
      auto-optimise-store = true
      max-jobs = auto

      keep-outputs = true # by default nix deletes build dependencies and leaves only resuliting package, this prevents it, useful for development

      # allow-unsafe-native-code-during-evaluation = true # allows use of builtins.exec
    '';

    gc.automatic = true;

    # FIXME: https://cache.nixos.org should not be added by hand, but rather merged
    binaryCaches = [
      "https://cache.nixos.org"
      "https://cachix.cachix.org"
      "https://srghma.cachix.org"
      "https://hie-nix.cachix.org"
    ];

    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "srghma.cachix.org-1:EUHKjTh/WKs49hFtw6bwDE9oQLeX5afml0cAKc97MbI="
      "hie-nix.cachix.org-1:EjBSHzF6VmDnzqlldGXbi0RM3HdjfTU3yDRi9Pd0jTY="
    ];
  };

  # use unstable
  # nix.package = pkgs.nixUnstable;

  virtualisation.docker = {
    enable = true;
    storageDriver = "zfs";
  };

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.libvirtd.enable = true;
  # virtualisation.memorySize = 1024;

  system.stateVersion = "18.09";
}
