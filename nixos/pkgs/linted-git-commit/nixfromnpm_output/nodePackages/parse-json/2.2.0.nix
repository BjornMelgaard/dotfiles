{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "parse-json";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/parse-json/-/parse-json-2.2.0.tgz";
      sha1 = "f480f40434ef80741f8469099f8dea18f55a4dc9";
    };
    deps = with nodePackages; [
      error-ex_1-3-2
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/parse-json";
      description = "Parse JSON with more helpful errors";
      keywords = [
        "parse"
        "json"
        "graceful"
        "error"
        "message"
        "humanize"
        "friendly"
        "helpful"
        "string"
        "str"
      ];
    };
  }
