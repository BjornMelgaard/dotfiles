{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "rimraf";
    version = "2.6.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/rimraf/-/rimraf-2.6.2.tgz";
      sha1 = "2ed8150d24a16ea8651e6d6ef0f47c4158ce7a36";
    };
    deps = with nodePackages; [
      glob_7-1-3
    ];
    meta = {
      homepage = "https://github.com/isaacs/rimraf#readme";
      description = "A deep deletion module for node (like `rm -rf`)";
    };
  }
