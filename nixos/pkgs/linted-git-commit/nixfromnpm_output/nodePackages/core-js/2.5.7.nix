{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "core-js";
    version = "2.5.7";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/core-js/-/core-js-2.5.7.tgz";
      sha1 = "f972608ff0cead68b841a16a932d0b183791814e";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/zloirock/core-js#readme";
      description = "Standard library";
      keywords = [
        "ES3"
        "ES5"
        "ES6"
        "ES7"
        "ES2015"
        "ES2016"
        "ES2017"
        "ECMAScript 3"
        "ECMAScript 5"
        "ECMAScript 6"
        "ECMAScript 7"
        "ECMAScript 2015"
        "ECMAScript 2016"
        "ECMAScript 2017"
        "Harmony"
        "Strawman"
        "Map"
        "Set"
        "WeakMap"
        "WeakSet"
        "Promise"
        "Symbol"
        "TypedArray"
        "setImmediate"
        "Dict"
        "polyfill"
        "shim"
      ];
    };
  }
