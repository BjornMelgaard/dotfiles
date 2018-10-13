{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "read-pkg";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/read-pkg/-/read-pkg-1.1.0.tgz";
      sha1 = "f5ffaa5ecd29cb31c0474bca7d756b6bb29e3f28";
    };
    deps = with nodePackages; [
      normalize-package-data_2-4-0
      load-json-file_1-1-0
      path-type_1-1-0
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/read-pkg";
      description = "Read a package.json file";
      keywords = [
        "json"
        "read"
        "parse"
        "file"
        "fs"
        "graceful"
        "load"
        "pkg"
        "package"
        "normalize"
      ];
    };
  }
