{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "xtend";
    version = "4.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/xtend/-/xtend-4.0.1.tgz";
      sha1 = "a5c6d532be656e23db820efb943a1f04998d63af";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/Raynos/xtend";
      description = "extend like a boss";
      keywords = [
        "extend"
        "merge"
        "options"
        "opts"
        "object"
        "array"
      ];
    };
  }
