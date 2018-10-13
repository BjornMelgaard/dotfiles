{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "minimist";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/minimist/-/minimist-1.2.0.tgz";
      sha1 = "a35008b20f41383eec1fb914f4cd5df79a264284";
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
