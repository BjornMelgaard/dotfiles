{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "core-util-is";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz";
      sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/isaacs/core-util-is#readme";
      description = "The `util.is*` functions introduced in Node v0.12.";
      keywords = [
        "util"
        "isBuffer"
        "isArray"
        "isNumber"
        "isString"
        "isRegExp"
        "isThis"
        "isThat"
        "polyfill"
      ];
    };
  }
