{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "path-exists";
    version = "2.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/path-exists/-/path-exists-2.1.0.tgz";
      sha1 = "0feb6c64f0fc518d9a754dd5efb62c7022761f4b";
    };
    deps = with nodePackages; [
      pinkie-promise_2-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/path-exists";
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
