{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "spdx-correct";
    version = "3.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/spdx-correct/-/spdx-correct-3.0.2.tgz";
      sha1 = "19bb409e91b47b1ad54159243f7312a858db3c2e";
    };
    deps = with nodePackages; [
      spdx-license-ids_3-0-1
      spdx-expression-parse_3-0-0
    ];
    meta = {
      homepage = "https://github.com/jslicense/spdx-correct.js#readme";
      description = "correct invalid SPDX expressions";
      keywords = [
        "SPDX"
        "law"
        "legal"
        "license"
        "metadata"
      ];
    };
  }
