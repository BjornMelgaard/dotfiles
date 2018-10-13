{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "pify";
    version = "2.3.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/pify/-/pify-2.3.0.tgz";
      sha1 = "ed141a6ac043a849ea588498e7dca8b15330e90c";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/pify";
      description = "Promisify a callback-style function";
      keywords = [
        "promise"
        "promises"
        "promisify"
        "denodify"
        "denodeify"
        "callback"
        "cb"
        "node"
        "then"
        "thenify"
        "convert"
        "transform"
        "wrap"
        "wrapper"
        "bind"
        "to"
        "async"
        "es2015"
      ];
    };
  }
