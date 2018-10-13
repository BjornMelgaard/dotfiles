{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "brace-expansion";
    version = "1.1.11";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
      sha1 = "3c7fcbf529d87226f3d2f52b966ff5271eb441dd";
    };
    deps = with nodePackages; [
      balanced-match_1-0-0
      concat-map_0-0-1
    ];
    meta = {
      homepage = "https://github.com/juliangruber/brace-expansion";
      description = "Brace expansion as known from sh/bash";
    };
  }
