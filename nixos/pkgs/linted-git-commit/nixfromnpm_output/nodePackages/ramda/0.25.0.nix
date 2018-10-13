{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "ramda";
    version = "0.25.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/ramda/-/ramda-0.25.0.tgz";
      sha1 = "8fdf68231cffa90bc2f9460390a0cb74a29b29a9";
    };
    deps = [];
    meta = {
      homepage = "http://ramdajs.com/";
      description = "A practical functional library for JavaScript programmers.";
    };
  }
