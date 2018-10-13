{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "array-find-index";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/array-find-index/-/array-find-index-1.0.2.tgz";
      sha1 = "df010aa1287e164bbda6f9723b0a96a1ec4187a1";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/array-find-index#readme";
      description = "ES2015 `Array#findIndex()` ponyfill";
      keywords = [
        "es2015"
        "ponyfill"
        "polyfill"
        "shim"
        "find"
        "index"
        "findindex"
        "array"
      ];
    };
  }
