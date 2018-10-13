{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "validate-npm-package-license";
    version = "3.0.4";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz";
      sha1 = "fc91f6b9c7ba15c857f4cb2c5defeec39d4f410a";
    };
    deps = with nodePackages; [
      spdx-correct_3-0-2
      spdx-expression-parse_3-0-0
    ];
    meta = {
      homepage = "https://github.com/kemitchell/validate-npm-package-license.js#readme";
      description = "Give me a string and I'll tell you if it's a valid npm package license string";
      keywords = [
        "license"
        "npm"
        "package"
        "validation"
      ];
    };
  }
