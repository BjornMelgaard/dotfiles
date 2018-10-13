{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "lodash.assign";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/lodash.assign/-/lodash.assign-4.2.0.tgz";
      sha1 = "0d99f3ccd7a6d261d19bdaeb9245005d285808e7";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://lodash.com/";
      description = "The lodash method `_.assign` exported as a module.";
      keywords = [
        "lodash-modularized"
        "assign"
      ];
    };
  }
