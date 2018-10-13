{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "q";
    version = "1.5.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/q/-/q-1.5.1.tgz";
      sha1 = "7e32f75b41381291d04611f1bf14109ac00651d7";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/kriskowal/q";
      description = "A library for promises (CommonJS/Promises/A,B,D)";
      keywords = [
        "q"
        "promise"
        "promises"
        "promises-a"
        "promises-aplus"
        "deferred"
        "future"
        "async"
        "flow control"
        "fluent"
        "browser"
        "node"
      ];
    };
  }
