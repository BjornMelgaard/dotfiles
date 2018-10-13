{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "dot-prop";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/dot-prop/-/dot-prop-3.0.0.tgz";
      sha1 = "1b708af094a49c9a0e7dbcad790aba539dac1177";
    };
    deps = with nodePackages; [
      is-obj_1-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/dot-prop#readme";
      description = "Get, set, or delete a property from a nested object using a dot path";
      keywords = [
        "obj"
        "object"
        "prop"
        "property"
        "dot"
        "path"
        "get"
        "set"
        "delete"
        "del"
        "access"
        "notation"
        "dotty"
      ];
    };
  }
