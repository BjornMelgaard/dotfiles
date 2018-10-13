{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "object-assign";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz";
      sha1 = "2109adc7965887cfc05cbbd442cac8bfbb360863";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/object-assign#readme";
      description = "ES2015 `Object.assign()` ponyfill";
      keywords = [
        "object"
        "assign"
        "extend"
        "properties"
        "es2015"
        "ecmascript"
        "harmony"
        "ponyfill"
        "prollyfill"
        "polyfill"
        "shim"
        "browser"
      ];
    };
  }
