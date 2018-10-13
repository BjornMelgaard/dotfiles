{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "parse-json";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/parse-json/-/parse-json-3.0.0.tgz";
      sha1 = "fa6f47b18e23826ead32f263e744d0e1e847fb13";
    };
    deps = with nodePackages; [
      error-ex_1-3-2
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/parse-json#readme";
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
