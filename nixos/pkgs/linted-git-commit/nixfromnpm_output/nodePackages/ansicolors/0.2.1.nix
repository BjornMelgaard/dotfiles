{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "ansicolors";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/ansicolors/-/ansicolors-0.2.1.tgz";
      sha1 = "be089599097b74a5c9c4a84a0cdbcdb62bd87aef";
    };
    deps = [];
    devDependencies = [];
    meta = {
      description = "Functions that surround a string with ansicolor codes so it prints in color.";
      keywords = [
        "ansi"
        "colors"
        "highlight"
        "string"
      ];
    };
  }
