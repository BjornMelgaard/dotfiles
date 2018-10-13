{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "shebang-regex";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/shebang-regex/-/shebang-regex-1.0.0.tgz";
      sha1 = "da42f49740c0b42db2ca9728571cb190c98efea3";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/shebang-regex";
      description = "Regular expression for matching a shebang";
      keywords = [
        "re"
        "regex"
        "regexp"
        "shebang"
        "match"
        "test"
      ];
    };
  }
