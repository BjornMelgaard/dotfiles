{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "concat-map";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
      sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/substack/node-concat-map";
      description = "concatenative mapdashery";
      keywords = [
        "concat"
        "concatMap"
        "map"
        "functional"
        "higher-order"
      ];
    };
  }
