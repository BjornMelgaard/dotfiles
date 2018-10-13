{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "chalk";
    version = "2.4.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/chalk/-/chalk-2.4.1.tgz";
      sha1 = "18c49ab16a037b6eb0152cc83e3471338215b66e";
    };
    deps = with nodePackages; [
      ansi-styles_3-2-1
      supports-color_5-5-0
      escape-string-regexp_1-0-5
    ];
    meta = {
      homepage = "https://github.com/chalk/chalk#readme";
      description = "Terminal string styling done right";
      keywords = [
        "color"
        "colour"
        "colors"
        "terminal"
        "console"
        "cli"
        "string"
        "str"
        "ansi"
        "style"
        "styles"
        "tty"
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
