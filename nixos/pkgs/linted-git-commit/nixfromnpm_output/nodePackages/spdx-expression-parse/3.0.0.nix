{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "spdx-expression-parse";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/spdx-expression-parse/-/spdx-expression-parse-3.0.0.tgz";
      sha1 = "99e119b7a5da00e05491c9fa338b7904823b41d0";
    };
    deps = with nodePackages; [
      spdx-exceptions_2-2-0
      spdx-license-ids_3-0-1
    ];
    meta = {
      homepage = "https://github.com/jslicense/spdx-expression-parse.js#readme";
      description = "parse SPDX license expressions";
      keywords = [
        "SPDX"
        "law"
        "legal"
        "license"
        "metadata"
        "package"
        "package.json"
        "standards"
      ];
    };
  }
