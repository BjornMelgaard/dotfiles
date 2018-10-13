{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "balanced-match";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz";
      sha1 = "89b4d199ab2bee49de164ea02b89ce462d71b767";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/juliangruber/balanced-match";
      description = "Match balanced character pairs, like \"{\" and \"}\"";
      keywords = [
        "match"
        "regexp"
        "test"
        "balanced"
        "parse"
      ];
    };
  }
