{ options, config, pkgs, lib, ... }@args:

{
  imports = [
    ../modules/cachix.nix
    ../modules/unifiedGtkQtTheme.nix

    ./hardware-configuration.nix
    ./hardware-configuration-override.nix
    ./hardware-programs.nix
    ./systemd/disable-touchpad.nix
    ./users
  ];

  unifiedGtkQtTheme = {
    enable = true;

    theme.name = "Numix-SX-Light";
    theme.package = pkgs.numix-sx-gtk-theme;

    # TODO: not working, use home-manager
    iconTheme.name    = "Numix-Circle";
    iconTheme.package = pkgs.numix-icon-theme-circle;

    cursorTheme.name    = "Vanilla-DMZ";
    cursorTheme.package = pkgs.vanilla-dmz;

    font = "Cantarell 9";

    additionalGtk20 = ''
      gtk-cursor-theme-size=24
      gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
      gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
      gtk-button-images=0
      gtk-menu-images=0
      gtk-enable-event-sounds=1
      gtk-enable-input-feedback-sounds=0
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="none"
    '';

    additionalGtk30 = ''
      gtk-fallback-icon-theme=AwOkenDark
      gtk-application-prefer-dark-theme=true
      gtk-cursor-theme-size=0
      gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
      gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
      gtk-button-images=0
      gtk-menu-images=0
      gtk-enable-event-sounds=1
      gtk-enable-input-feedback-sounds=1
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle=hintfull
      gtk-xft-rgba=rgb
      gtk-modules=gail:atk-bridge
    '';
  };

  environment = import ./environment args;
  services    = import ./services    args;
  fonts       = import ./fonts       args;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
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
    java.enable = true;
    chromium.enable = true; # add chrome and chromium config files to /etc

    gnupg.agent = {
      enable = true;

      # use gnupg-agent instead ssh-agent to temporarily remember password for password-protected keys
      # don't forget to `ssh-add` to add key to keychain
      enableSSHSupport = true;
    };

    cachix = {
      enable = true;
      cachixSigningKey = import ../../secrets/cachixSigningKey.nix;
    };

    bash = {
      interactiveShellInit = ''
        source ${./shells/docker-compose.sh}
        source ${./shells/docker.sh}
        source ${./shells/git.sh}
        source ${./shells/nix.sh}
        source ${./shells/system.sh}
      '';
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;

      interactiveShellInit = ''
        source ${./zsh/movements.sh}
        source ${./shells/docker-compose.sh}
        source ${./shells/docker.sh}
        source ${./shells/git.sh}
        source ${./shells/nix.sh}
        source ${./shells/system.sh}

        DEFAULT_USER="srghma"

        autoload -U zmv

        # npm/yarn
        export PATH="$HOME/.node_modules/bin:$PATH"

        # npm/yarn local
        export PATH="$PATH:./node_modules/.bin"

        # gem
        GEM_HOME="$HOME/.gem/ruby/${pkgs.ruby_2_4.version.libDir}"
        GEM_PATH="$GEM_HOME"
        export PATH="$GEM_HOME/bin:$PATH"

        DOTFILES="$HOME/.dotfiles"

        PROJECT_PATHS=($HOME/projects)

        export MAKEFLAGS="-j5"
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

    # wireless.enable = true;
    networkmanager.enable = true;

    firewall = {
      # for libvirtd (https://nixos.org/nixops/manual/#idm140737318329504)
      # checkReversePath = false;

      enable = true;
      allowPing = true;

      allowedTCPPorts = [
        # 5432
        3000
      ];

      allowedUDPPorts = [
        40118 # https://github.com/rfc2822/GfxTablet
      ];
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

    # TODO: wait https://github.com/NixOS/nixpkgs/pull/44880
    # maxJobs = "auto";
    # maxJobs = 1;

    # 0 means to use all available cores
    buildCores = 0;
    # buildCores = 1;

    # max-jobs is about the number of derivations that Nix will build in parallel, while cores is about parallelism inside a derivation, e.g. what make -j will use

    extraOptions = ''
      auto-optimise-store = true
      max-jobs = auto

      # by default nix deletes build dependencies and leaves only resuliting package, this prevents it, useful for development
      keep-outputs = true

      # allows use of builtins.exec
      # allow-unsafe-native-code-during-evaluation = true
    '';

    gc.automatic = true;

    # FIXME: https://cache.nixos.org already exists in standard config and should not be added by hand, but rather merged
    binaryCaches = [
      "https://all-hies.cachix.org"
      "https://cache.nixos.org"
      "https://cachix.cachix.org"
      "https://srghma.cachix.org"
      "https://hie-nix.cachix.org"
      "https://nixcache.reflex-frp.org"
      "https://hydra.iohk.io"
    ];

    binaryCachePublicKeys = [
      "all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
      "srghma.cachix.org-1:EUHKjTh/WKs49hFtw6bwDE9oQLeX5afml0cAKc97MbI="
      "hie-nix.cachix.org-1:EjBSHzF6VmDnzqlldGXbi0RM3HdjfTU3yDRi9Pd0jTY="
      "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];

    trustedUsers = [ "root" "srghma" ];
  };

  # use unstable
  # nix.package = pkgs.nixUnstable;

  virtualisation.docker = {
    enable = true;
    # liveRestore = false;
    storageDriver = "overlay"; # TODO: use overlay2, delete before switch /var/lib/docker
    # extraOptions = "--host=0.0.0.0:2375";
    # extraOptions = "-H unix:///var/run/docker.sock";
  };

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.libvirtd.enable = true;
  # virtualisation.memorySize = 1024;

  system.stateVersion = "19.03";
}
