{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "semver";
    version = "5.6.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/semver/-/semver-5.6.0.tgz";
      sha1 = "7e74256fbaa49c75aa7c7a205cc22799cac80004";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/npm/node-semver#readme";
      description = "The semantic version parser used by npm.";
    };
  }
