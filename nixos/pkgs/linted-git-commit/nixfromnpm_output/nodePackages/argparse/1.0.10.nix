{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "argparse";
    version = "1.0.10";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz";
      sha1 = "bcd6791ea5ae09725e17e5ad988134cd40b3d911";
    };
    deps = with nodePackages; [
      sprintf-js_1-0-3
    ];
    meta = {
      homepage = "https://github.com/nodeca/argparse#readme";
      description = "Very powerful CLI arguments parser. Native port of argparse - python's options parsing library";
      keywords = [
        "cli"
        "parser"
        "argparse"
        "option"
        "args"
      ];
    };
  }
