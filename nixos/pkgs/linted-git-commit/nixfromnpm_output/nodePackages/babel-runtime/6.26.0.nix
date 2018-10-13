{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "babel-runtime";
    version = "6.26.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/babel-runtime/-/babel-runtime-6.26.0.tgz";
      sha1 = "965c7058668e82b55d7bfe04ff2337bc8b5647fe";
    };
    deps = with nodePackages; [
      regenerator-runtime_0-11-1
      core-js_2-5-7
    ];
    meta = {
      description = "babel selfContained runtime";
    };
  }
