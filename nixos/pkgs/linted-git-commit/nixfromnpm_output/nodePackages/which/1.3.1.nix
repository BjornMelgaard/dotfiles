{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "which";
    version = "1.3.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/which/-/which-1.3.1.tgz";
      sha1 = "a45043d54f5805316da8d62f9f50918d3da70b0a";
    };
    deps = with nodePackages; [
      isexe_2-0-0
    ];
    meta = {
      homepage = "https://github.com/isaacs/node-which#readme";
      description = "Like which(1) unix command. Find the first instance of an executable in the PATH.";
    };
  }
