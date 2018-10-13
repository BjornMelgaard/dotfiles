{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "camelcase-keys";
    version = "2.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/camelcase-keys/-/camelcase-keys-2.1.0.tgz";
      sha1 = "308beeaffdf28119051efa1d932213c91b8f92e7";
    };
    deps = with nodePackages; [
      map-obj_1-0-1
      camelcase_2-1-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/camelcase-keys";
      description = "Convert object keys to camelCase";
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
        "camelcase"
        "camel-case"
        "camel"
        "case"
        "dash"
        "hyphen"
        "dot"
        "underscore"
        "separator"
        "string"
        "text"
        "convert"
      ];
    };
  }
