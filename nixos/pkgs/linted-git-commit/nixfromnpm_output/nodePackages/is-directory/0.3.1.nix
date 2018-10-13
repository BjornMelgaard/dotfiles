{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-directory";
    version = "0.3.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/is-directory/-/is-directory-0.3.1.tgz";
      sha1 = "61339b6f2475fc772fd9c9d83f5c8575dc154ae1";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/jonschlinkert/is-directory";
      description = "Returns true if a filepath exists on the file system and it's directory.";
      keywords = [
        "dir"
        "directories"
        "directory"
        "dirs"
        "file"
        "filepath"
        "files"
        "fp"
        "fs"
        "node"
        "node.js"
        "path"
        "paths"
        "system"
      ];
    };
  }
