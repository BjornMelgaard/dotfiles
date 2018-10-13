{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "decamelize";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/decamelize/-/decamelize-1.2.0.tgz";
      sha1 = "f6534d15148269b20352e7bee26f501f9a191290";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/decamelize#readme";
      description = "Convert a camelized string into a lowercased one with a custom separator: unicornRainbow → unicorn_rainbow";
      keywords = [
        "decamelize"
        "decamelcase"
        "camelcase"
        "lowercase"
        "case"
        "dash"
        "hyphen"
        "string"
        "str"
        "text"
        "convert"
      ];
    };
  }
