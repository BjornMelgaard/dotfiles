{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "p-try";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/p-try/-/p-try-1.0.0.tgz";
      sha1 = "cbc79cdbaf8fd4228e13f621f2b1a237c1b207b3";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/p-try#readme";
      description = "`Promise#try()` ponyfill - Starts a promise chain";
      keywords = [
        "promise"
        "try"
        "resolve"
        "function"
        "catch"
        "async"
        "await"
        "promises"
        "settled"
        "ponyfill"
        "polyfill"
        "shim"
        "bluebird"
      ];
    };
  }
