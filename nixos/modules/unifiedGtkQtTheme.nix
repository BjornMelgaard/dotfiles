# stolen from https://github.com/rychly/nur-packages/blob/79fa016d59006fb02fbd3590cbc756f46977cc4b/modules/unified-gtk-qt-theme.nix#L67

{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.unifiedGtkQtTheme;

  ## modules

  mainModuleOptions = {

    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Sets Adwaita as the unified GTK/Qt4/Qt5 theme.";
    };

    iconTheme = {
      name = mkOption {
        type = types.str;
        default = "breeze";
        description = "Name of an icon theme to use with the unified GTK/Qt4/Qt5 theme.";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.breeze-icons;
        description = "Package/derivation of the icon theme to use with the unified GTK/Qt4/Qt5 theme.";
      };
    };

    theme = {
      name = mkOption {
        type = types.str;
        default = "Adwaita";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.gnome3.adwaita-icon-theme;
      };
    };

    cursorTheme = {
      name = mkOption {
        type = types.str;
        default = "Adwaita";
      };

      package = mkOption {
        type = types.package;
        default = pkgs.gnome3.adwaita-icon-theme;
      };
    };

    font = mkOption {
      type = types.str;
      default = "DejaVu Sans 11";
      description = "Font to use with the unified GTK/Qt4/Qt5 theme.";
    };

    additionalGtk20 = mkOption {
      type = types.str;
      default = "";
    };

    additionalGtk30 = mkOption {
      type = types.str;
      default = "";
    };
  };

  ## shortcuts

  gtkini = ''
    gtk-cursor-theme-name="${cfg.cursorTheme.name}"
    gtk-icon-theme-name="${cfg.iconTheme.name}"
    gtk-theme-name="${cfg.theme.name}"
    gtk-font-name="${cfg.font}"
  '';

in {
  options.unifiedGtkQtTheme = mainModuleOptions;

  # see also https://wiki.archlinux.org/index.php/GTK%2B and https://wiki.archlinux.org/index.php/Qt

  config = mkIf (cfg.enable) {

    # QT4/5 global theme
    environment.etc."xdg/Trolltech.conf".text = ''
      [Qt]
      style=GTK+
    '';

    # GTK2/GTK3 global theme (widget and icon theme)
    environment.etc."gtk-2.0/gtkrc".text = ''
      ${gtkini}
      ${cfg.additionalGtk20}
    '';
    environment.etc."gtk-3.0/settings.ini".text = ''
      [Settings]
      ${gtkini}
      ${cfg.additionalGtk30}
    '';

    environment.systemPackages = with pkgs; [
      cfg.theme.package
      cfg.cursorTheme.package

      # No Qt theme (from Qt 4.5, QGtkStyle style is included in Qt)
      # No Gtk2/Gtk3 theme (the default theme is already included in pkgs.gnome-themes-standard)
      # Icons for both GNOME/KDE applications including a fallback
      cfg.iconTheme.package     # KDE/GNOME
      gnome3.adwaita-icon-theme # GNOME fallback
      hicolor_icon_theme        # general fallback

      # SVG loader for pixbuf (needed for GTK svg icon themes)
      librsvg
    ];

    environment.variables = {
      # Qt4/Qt5: convince it to use our preferred style
      "QT_QPA_PLATFORMTHEME" = lib.mkForce "gtk2";
      "QT_STYLE_OVERRIDE" = "GTK+";
      # GTK2/GTK3: libs/theme definitions in lib/share directories of their packages
      "GTK_PATH" = lib.mkBefore [ "${pkgs.gnome-themes-standard}/lib/gtk-2.0" ];
      "GTK2_RC_FILES" = lib.mkBefore [ "${pkgs.gnome-themes-standard}/share/themes/Adwaita/gtk-2.0/gtkrc" ];
      # "XDG_DATA_DIRS" = lib.mkBefore [ "${pkgs.gnome-themes-standard}/share" ];
    };

    environment.extraInit = lib.mkAfter ''
      # QT/GTK: remove local user overrides (for determinism, causes hard to find bugs)
      rm -f ~/.config/Trolltech.conf ~/.gtkrc-2.0 ~/.config/gtk-3.0/settings.ini
      # SVG loader for pixbuf (needed for GTK svg icon themes); cannot be in environment.variables as there is a shell pattern expansion
      export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.librsvg}/lib/gdk-pixbuf-2.0/*/loaders.cache)
    '';

    # Enable access to /share where the themes are.
    environment.pathsToLink = [ "/share" ];
  };
}

