{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "isarray";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz";
      sha1 = "bb935d48582cba168c06834957a54a3e07124f11";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/juliangruber/isarray";
      description = "Array#isArray for older browsers";
      keywords = [
        "browser"
        "isarray"
        "array"
      ];
    };
  }
