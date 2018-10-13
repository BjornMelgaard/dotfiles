{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "inherits";
    version = "2.0.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz";
      sha1 = "633c2c83e3da42a502f52466022480f4208261de";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/isaacs/inherits#readme";
      description = "Browser-friendly inheritance fully compatible with standard node.js inherits()";
      keywords = [
        "inheritance"
        "class"
        "klass"
        "oop"
        "object-oriented"
        "inherits"
        "browser"
        "browserify"
      ];
    };
  }
