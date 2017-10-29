# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

with lib;

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ];

  hardware = {
    # bumblebee = { 
    #   enable = true;
    #   driver = "nvidia"; 
    # };
    # opengl.driSupport32Bit = true; 
    # opengl.enable=true; 
  };

  boot = {
    tmpOnTmpfs = true;
    cleanTmpDir = true;
    loader = { # Bootloader
      efi.canTouchEfiVariables = true;
      # efi.efiSysMountPoint = "/boot";
      systemd-boot.enable = true;
    };
  };

  networking = {
    hostName = "machine";

    # TODO: cannot be started at the same time, ask for assert
    # wireless.enable = false;
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowPing = false;
    };
  };

  # Internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      inconsolata # monospaced
      ubuntu_font_family
      powerline-fonts
      font-awesome-ttf
      source-code-pro
      unifont # some international languages
    ];
    fontconfig = {
      dpi = 96;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Kiev";

  nixpkgs.config = {
    # Allow unfree packages
    allowUnfree = true;
  };

  environment = {
    variables.EDITOR="nvim";
  };

  environment.systemPackages = with pkgs; [
    git
    docker
    nodejs
    feh 
    # screenfetch
    mpv
    ranger 
    transmission
    # compton-git
    # dmenu
    rofi
    termite
    ag
    atool
    numix-gtk-theme
    wget 
    neovim
    kakoune
    termite
    tmux
    vscode
    copyq
    google-chrome
    xclip
    file
    # gksu
    # hdf5
    zip
    unzip
    htop
    nix-repl

    # Mouse hiding
    # unclutter

    # Encryption key management
    gnupg

    # Make NTFS filesystems (e.g., USB drives)
    ntfs3g

    # Encrypted USB sticks etc
    cryptsetup

    # GUI for sound control
    pavucontrol
  ];

  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    xserver = {
      enable = true;
      # verbose = 7;

      # TODO: find why https://github.com/NixOS/nixpkgs/blob/07bc859e9acec3cc6f7a8129e4b05a7584fef209/nixos/modules/services/x11/xserver.nix#L241
      # videoDrivers = [ "nvidia" ];
      # videoDrivers = [ "intel" "nvidiaLegacy304" ];
      # videoDrivers = [ "intel" "nvidia" ];
      # videoDrivers = [ "intel" "nvidiaBeta" ];
      # videoDrivers = [ "intel" "nvidiaLegacy340" ];
      # videoDrivers = [ "vesa" ];
      # videoDrivers = [ "nouveau" ];
      # videoDrivers = mkForce [ "modesetting" ];

      layout = "us,ru";
      xkbOptions = "caps:swapescape,grp:rctrl_rshift_toggle";
      xkbVariant = "qwerty";

      windowManager = {
        i3 = {
          enable = true;
        };
      };

      desktopManager.default = "none";

      displayManager = {
        lightdm = {
          enable = true;
	  autoLogin = {
	    enable = true;
	    user = "bjorn";
	  };
        };
        # auto = {
        #   enable = true;
        #   user = "bjorn";
        # };

        # sessionCommands = ''
        #   ${pkgs.xmonad-with-packages}/bin/xmonad
        # '';
      };

      # xbanish = {
      #   enable = true;
      # };
      # compton = {
      #   enable = true;
      # };
      # redshift = {
      #   enable = true;
      # };
    };
  };

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;
    extraUsers = 
      let hashedPassword = "$6$Xne/w.j0RkrN$lRcThoZiNea2YBhfbeVJ2dgylt6Ov0IZbh1bf3flR6DYNpnv8YTTPJGwhk/8XPGNkgIrlKtXfvBowCZ7nbVt6/";
      in {
        root = {
          inherit hashedPassword;
        };
        bjorn = {
          isNormalUser = true;
          extraGroups = [ "audio" "disk" "wheel" "networkmanager" ];
          inherit hashedPassword;
        };
      };
  };

  swapDevices = singleton 
    { device = "/dev/disk/by-label/swap"; };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      ohMyZsh = {
        enable = true;
        theme = "wezm";
        plugins = [
          "vi-mode"
          "tmux"
          "history-substring-search"
          "common-aliases"
          "dircycle"
          "dirpersist"
          "colorize"
          "compleat"
          "command-not-found"
          "pj"
          "zsh-navigation-tools"
          # "bundler"
          # "ruby"
          # "rails"
          # "gem"
          # "rvm"
          # "stack"
          # "docker"
          # "docker-compose"
          "systemd"
          "sudo"
          "git"
          # "yarn"
          # "rake-fast"
          # "zsh-autosuggestions"
        ];
      };
    };
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false; # You Only Live Once
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?
}
