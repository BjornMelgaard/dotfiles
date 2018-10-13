{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "ansi-styles";
    version = "2.2.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-2.2.1.tgz";
      sha1 = "b432dd3358b634cf75e1e4664368240533c1ddbe";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/chalk/ansi-styles#readme";
      description = "ANSI escape codes for styling strings in the terminal";
      keywords = [
        "ansi"
        "styles"
        "color"
        "colour"
        "colors"
        "terminal"
        "console"
        "cli"
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
