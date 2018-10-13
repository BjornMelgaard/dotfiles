{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "pinkie";
    version = "2.0.4";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/pinkie/-/pinkie-2.0.4.tgz";
      sha1 = "72556b80cfa0d48a974e80e77248e80ed4f7f870";
    };
    deps = [];
    meta = {
      description = "Itty bitty little widdle twinkie pinkie ES2015 Promise implementation";
      keywords = [
        "promise"
        "promises"
        "es2015"
        "es6"
      ];
    };
  }
