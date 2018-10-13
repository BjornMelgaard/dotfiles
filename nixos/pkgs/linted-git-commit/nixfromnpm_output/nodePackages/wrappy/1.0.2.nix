{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "wrappy";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
      sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/npm/wrappy";
      description = "Callback wrapping utility";
    };
  }
