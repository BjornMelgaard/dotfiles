{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "get-stdin";
    version = "4.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/get-stdin/-/get-stdin-4.0.1.tgz";
      sha1 = "b968c6b0a04384324902e8bf1a5df32579a450fe";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/get-stdin";
      description = "Easier stdin";
      keywords = [
        "std"
        "stdin"
        "stdio"
        "concat"
        "buffer"
        "stream"
        "process"
        "stream"
      ];
    };
  }
