{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "number-is-nan";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/number-is-nan/-/number-is-nan-1.0.1.tgz";
      sha1 = "097b602b53422a522c1afb8790318336941a011d";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/number-is-nan#readme";
      description = "ES2015 Number.isNaN() ponyfill";
      keywords = [
        "es2015"
        "ecmascript"
        "ponyfill"
        "polyfill"
        "shim"
        "number"
        "is"
        "nan"
        "not"
      ];
    };
  }
