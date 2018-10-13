{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "trim-newlines";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/trim-newlines/-/trim-newlines-1.0.0.tgz";
      sha1 = "5887966bb582a4503a41eb524f7d35011815a613";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/trim-newlines";
      description = "Trim newlines from the start and/or end of a string";
      keywords = [
        "trim"
        "newline"
        "newlines"
        "linebreak"
        "lf"
        "crlf"
        "left"
        "right"
        "start"
        "end"
        "string"
        "str"
        "remove"
        "delete"
        "strip"
      ];
    };
  }
