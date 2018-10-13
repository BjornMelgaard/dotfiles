{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "array-ify";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/array-ify/-/array-ify-1.0.0.tgz";
      sha1 = "9e528762b4a9066ad163a6962a364418e9626ece";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/stevemao/array-ify";
      description = "Turn anything into an array";
      keywords = [
        "array-ify"
        "array"
        "arr"
        "arrify"
        "arrayify"
        "convert"
        "value"
      ];
    };
  }
