{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "ansi-styles";
    version = "3.2.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz";
      sha1 = "41fbb20243e50b12be0f04b8dedbf07520ce841d";
    };
    deps = with nodePackages; [
      color-convert_1-9-3
    ];
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
