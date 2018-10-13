{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "map-obj";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/map-obj/-/map-obj-1.0.1.tgz";
      sha1 = "d933ceb9205d82bdcf4886f6742bdc2b4dea146d";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/map-obj";
      description = "Map object keys and values into a new object";
      keywords = [
        "map"
        "obj"
        "object"
        "key"
        "keys"
        "value"
        "values"
        "val"
        "iterate"
        "iterator"
      ];
    };
  }
