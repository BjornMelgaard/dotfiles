{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-utf8";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/is-utf8/-/is-utf8-0.2.1.tgz";
      sha1 = "4b0da1442104d1b336340e80797e865cf39f7d72";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://github.com/wayfind/is-utf8#readme";
      description = "Detect if a buffer is utf8 encoded.";
      keywords = [ "utf8" "charset" ];
    };
  }
