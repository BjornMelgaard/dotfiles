{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-finite";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/is-finite/-/is-finite-1.0.2.tgz";
      sha1 = "cc6677695602be550ef11e8b4aa6305342b6d0aa";
    };
    deps = with nodePackages; [
      number-is-nan_1-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/is-finite#readme";
      description = "ES2015 Number.isFinite() ponyfill";
      keywords = [
        "es2015"
        "ponyfill"
        "polyfill"
        "shim"
        "number"
        "finite"
        "is"
      ];
    };
  }
