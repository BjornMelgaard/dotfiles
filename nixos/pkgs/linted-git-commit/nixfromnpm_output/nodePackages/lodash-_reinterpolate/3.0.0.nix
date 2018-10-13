{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "lodash._reinterpolate";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/lodash._reinterpolate/-/lodash._reinterpolate-3.0.0.tgz";
      sha1 = "0ccf2d89166af03b3663c796538b75ac6e114d9d";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://lodash.com/";
      description = "The modern build of lodash’s internal `reInterpolate` as a module.";
    };
  }
