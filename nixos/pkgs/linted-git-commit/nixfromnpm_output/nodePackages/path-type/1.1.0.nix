{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "path-type";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/path-type/-/path-type-1.1.0.tgz";
      sha1 = "59c44f7ee491da704da415da5a4070ba4f8fe441";
    };
    deps = with nodePackages; [
      graceful-fs_4-1-11
      pify_2-3-0
      pinkie-promise_2-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/path-type";
      description = "Check if a path is a file, directory, or symlink";
      keywords = [
        "path"
        "fs"
        "type"
        "is"
        "check"
        "directory"
        "dir"
        "file"
        "filepath"
        "symlink"
        "symbolic"
        "link"
        "stat"
        "stats"
        "filesystem"
      ];
    };
  }
