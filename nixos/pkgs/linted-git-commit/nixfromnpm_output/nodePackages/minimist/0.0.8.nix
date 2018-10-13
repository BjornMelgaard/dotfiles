{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "minimist";
    version = "0.0.8";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
      sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/substack/minimist";
      description = "parse argument options";
      keywords = [
        "argv"
        "getopt"
        "parser"
        "optimist"
      ];
    };
  }
