{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-arrayish";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/is-arrayish/-/is-arrayish-0.2.1.tgz";
      sha1 = "77c99840527aa8ecb1a8ba697b80645a7a926a9d";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/qix-/node-is-arrayish#readme";
      description = "Determines if an object can be used as an array";
      keywords = [
        "is"
        "array"
        "duck"
        "type"
        "arrayish"
        "similar"
        "proto"
        "prototype"
        "type"
      ];
    };
  }
