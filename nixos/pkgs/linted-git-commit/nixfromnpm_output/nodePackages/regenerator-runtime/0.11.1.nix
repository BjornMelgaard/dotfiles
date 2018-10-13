{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "regenerator-runtime";
    version = "0.11.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.11.1.tgz";
      sha1 = "be05ad7f9bf7d22e056f9726cee5017fbf19e2e9";
    };
    deps = [];
    devDependencies = [];
    meta = {
      description = "Runtime for Regenerator-compiled generator and async functions.";
      keywords = [
        "regenerator"
        "runtime"
        "generator"
        "async"
      ];
    };
  }
