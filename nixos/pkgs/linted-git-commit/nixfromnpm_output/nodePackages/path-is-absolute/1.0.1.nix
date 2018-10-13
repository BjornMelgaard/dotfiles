{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "path-is-absolute";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
      sha1 = "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/path-is-absolute#readme";
      description = "Node.js 0.12 path.isAbsolute() ponyfill";
      keywords = [
        "path"
        "paths"
        "file"
        "dir"
        "absolute"
        "isabsolute"
        "is-absolute"
        "built-in"
        "util"
        "utils"
        "core"
        "ponyfill"
        "polyfill"
        "shim"
        "is"
        "detect"
        "check"
      ];
    };
  }
