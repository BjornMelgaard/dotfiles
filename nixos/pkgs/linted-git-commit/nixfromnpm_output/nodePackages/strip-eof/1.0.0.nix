{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "strip-eof";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/strip-eof/-/strip-eof-1.0.0.tgz";
      sha1 = "bb43ff5598a6eb05d89b59fcd129c983313606bf";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/strip-eof";
      description = "Strip the End-Of-File (EOF) character from a string/buffer";
      keywords = [
        "strip"
        "trim"
        "remove"
        "delete"
        "eof"
        "end"
        "file"
        "newline"
        "linebreak"
        "character"
        "string"
        "buffer"
      ];
    };
  }
