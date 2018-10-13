{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "pinkie-promise";
    version = "2.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/pinkie-promise/-/pinkie-promise-2.0.1.tgz";
      sha1 = "2135d6dfa7a358c069ac9b178776288228450ffa";
    };
    deps = with nodePackages; [
      pinkie_2-0-4
    ];
    meta = {
      homepage = "https://github.com/floatdrop/pinkie-promise";
      description = "ES2015 Promise ponyfill";
      keywords = [
        "promise"
        "promises"
        "es2015"
        "es6"
        "polyfill"
        "ponyfill"
      ];
    };
  }
