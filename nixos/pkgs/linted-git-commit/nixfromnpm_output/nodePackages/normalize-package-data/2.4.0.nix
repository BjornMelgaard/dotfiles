{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "normalize-package-data";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/normalize-package-data/-/normalize-package-data-2.4.0.tgz";
      sha1 = "12f95a307d58352075a04907b84ac8be98ac012f";
    };
    deps = with nodePackages; [
      validate-npm-package-license_3-0-4
      hosted-git-info_2-7-1
      is-builtin-module_1-0-0
      semver_5-6-0
    ];
    meta = {
      homepage = "https://github.com/npm/normalize-package-data#readme";
      description = "Normalizes data that can be found in package.json files.";
    };
  }
