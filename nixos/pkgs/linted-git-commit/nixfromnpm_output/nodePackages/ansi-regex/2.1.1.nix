{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "ansi-regex";
    version = "2.1.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz";
      sha1 = "c3b33ab5ee360d86e0e628f0468ae7ef27d654df";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/chalk/ansi-regex#readme";
      description = "Regular expression for matching ANSI escape codes";
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
        "command-line"
        "text"
        "regex"
        "regexp"
        "re"
        "match"
        "test"
        "find"
        "pattern"
      ];
    };
  }
