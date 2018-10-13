{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "path-exists";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/path-exists/-/path-exists-3.0.0.tgz";
      sha1 = "ce0ebeaa5f78cb18925ea7d810d7b59b010fd515";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/path-exists#readme";
      description = "Check if a path exists";
      keywords = [
        "path"
        "exists"
        "exist"
        "file"
        "filepath"
        "fs"
        "filesystem"
        "file-system"
        "access"
        "stat"
      ];
    };
  }
