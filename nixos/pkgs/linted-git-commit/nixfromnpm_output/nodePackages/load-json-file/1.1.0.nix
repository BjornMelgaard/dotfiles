{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "load-json-file";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/load-json-file/-/load-json-file-1.1.0.tgz";
      sha1 = "956905708d58b4bab4c2261b04f59f31c99374c0";
    };
    deps = with nodePackages; [
      graceful-fs_4-1-11
      pify_2-3-0
      parse-json_2-2-0
      strip-bom_2-0-0
      pinkie-promise_2-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/load-json-file";
      description = "Read and parse a JSON file";
      keywords = [
        "json"
        "read"
        "parse"
        "file"
        "fs"
        "graceful"
        "load"
      ];
    };
  }
