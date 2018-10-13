{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "sprintf-js";
    version = "1.0.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz";
      sha1 = "04e6926f662895354f3dd015203633b857297e2c";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/alexei/sprintf.js#readme";
      description = "JavaScript sprintf implementation";
    };
  }
