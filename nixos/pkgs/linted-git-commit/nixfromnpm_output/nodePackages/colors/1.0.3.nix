{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "colors";
    version = "1.0.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/colors/-/colors-1.0.3.tgz";
      sha1 = "0433f44d809680fdeb60ed260f1b0c262e82a40b";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://github.com/Marak/colors.js";
      description = "get colors in your node.js console";
      keywords = [
        "ansi"
        "terminal"
        "colors"
      ];
    };
  }
