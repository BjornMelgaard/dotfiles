{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "lodash.template";
    version = "4.4.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/lodash.template/-/lodash.template-4.4.0.tgz";
      sha1 = "e73a0385c8355591746e020b99679c690e68fba0";
    };
    deps = with nodePackages; [
      lodash-_reinterpolate_3-0-0
      lodash-templatesettings_4-1-0
    ];
    devDependencies = [];
    meta = {
      homepage = "https://lodash.com/";
      description = "The lodash method `_.template` exported as a module.";
      keywords = [
        "lodash-modularized"
        "template"
      ];
    };
  }
