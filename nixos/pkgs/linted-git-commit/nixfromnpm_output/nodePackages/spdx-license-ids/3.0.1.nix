{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "spdx-license-ids";
    version = "3.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/spdx-license-ids/-/spdx-license-ids-3.0.1.tgz";
      sha1 = "e2a303236cac54b04031fa7a5a79c7e701df852f";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/shinnn/spdx-license-ids#readme";
      description = "A list of SPDX license identifiers";
      keywords = [
        "spdx"
        "license"
        "licenses"
        "id"
        "identifier"
        "identifiers"
        "json"
        "array"
        "oss"
      ];
    };
  }
