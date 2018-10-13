{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "escape-string-regexp";
    version = "1.0.5";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
      sha1 = "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/escape-string-regexp";
      description = "Escape RegExp special characters";
      keywords = [
        "escape"
        "regex"
        "regexp"
        "re"
        "regular"
        "expression"
        "string"
        "str"
        "special"
        "characters"
      ];
    };
  }
