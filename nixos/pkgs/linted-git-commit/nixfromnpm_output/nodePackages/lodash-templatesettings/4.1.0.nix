{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "lodash.templatesettings";
    version = "4.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/lodash.templatesettings/-/lodash.templatesettings-4.1.0.tgz";
      sha1 = "2b4d4e95ba440d915ff08bc899e4553666713316";
    };
    deps = with nodePackages; [
      lodash-_reinterpolate_3-0-0
    ];
    devDependencies = [];
    meta = {
      homepage = "https://lodash.com/";
      description = "The lodash method `_.templateSettings` exported as a module.";
      keywords = [
        "lodash-modularized"
        "templatesettings"
      ];
    };
  }
