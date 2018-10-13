{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "strip-ansi";
    version = "3.0.1";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz";
      sha1 = "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf";
    };
    deps = with nodePackages; [
      ansi-regex_2-1-1
    ];
    meta = {
      homepage = "https://github.com/chalk/strip-ansi";
      description = "Strip ANSI escape codes";
      keywords = [
        "strip"
        "trim"
        "remove"
        "ansi"
        "styles"
        "color"
        "colour"
        "colors"
        "terminal"
        "console"
        "string"
        "tty"
        "escape"
        "formatting"
        "rgb"
        "256"
        "shell"
        "xterm"
        "log"
        "logging"
        "command-line"
        "text"
      ];
    };
  }
