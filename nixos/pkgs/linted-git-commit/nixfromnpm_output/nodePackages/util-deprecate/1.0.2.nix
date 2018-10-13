{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "util-deprecate";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz";
      sha1 = "450d4dc9fa70de732762fbd2d4a28981419a0ccf";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://github.com/TooTallNate/util-deprecate";
      description = "The Node.js `util.deprecate()` function with browser support";
      keywords = [
        "util"
        "deprecate"
        "browserify"
        "browser"
        "node"
      ];
    };
  }
