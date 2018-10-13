{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "lodash.toarray";
    version = "4.4.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/lodash.toarray/-/lodash.toarray-4.4.0.tgz";
      sha1 = "24c4bfcd6b2fba38bfd0594db1179d8e9b656561";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://lodash.com/";
      description = "The lodash method `_.toArray` exported as a module.";
      keywords = [
        "lodash-modularized"
        "toarray"
      ];
    };
  }
