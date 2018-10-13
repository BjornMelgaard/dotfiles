{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "require-from-string";
    version = "2.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz";
      sha1 = "89a7fdd938261267318eafe14f9c32e598c36909";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/floatdrop/require-from-string#readme";
      description = "Require module from string";
    };
  }
