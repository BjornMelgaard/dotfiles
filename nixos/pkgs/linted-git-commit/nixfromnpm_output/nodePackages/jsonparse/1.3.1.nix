{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "jsonparse";
    version = "1.3.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/jsonparse/-/jsonparse-1.3.1.tgz";
      sha1 = "3f4dae4a91fac315f71062f8521cc239f1366280";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/creationix/jsonparse#readme";
      description = "This is a pure-js JSON streaming parser for node.js";
    };
  }
