{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "p-finally";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/p-finally/-/p-finally-1.0.0.tgz";
      sha1 = "3fbcfb15b899a44123b34b6dcc18b724336a2cae";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/p-finally#readme";
      description = "`Promise#finally()` ponyfill - Invoked when the promise is settled regardless of outcome";
      keywords = [
        "promise"
        "finally"
        "handler"
        "function"
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
