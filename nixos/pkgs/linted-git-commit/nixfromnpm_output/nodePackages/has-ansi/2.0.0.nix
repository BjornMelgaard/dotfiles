{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "has-ansi";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/has-ansi/-/has-ansi-2.0.0.tgz";
      sha1 = "34f5049ce1ecdf2b0649af3ef24e45ed35416d91";
    };
    deps = with nodePackages; [
      ansi-regex_2-1-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/has-ansi";
      description = "Check if a string has ANSI escape codes";
      keywords = [
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
        "has"
      ];
    };
  }
