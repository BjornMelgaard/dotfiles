{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "through";
    version = "2.3.8";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/through/-/through-2.3.8.tgz";
      sha1 = "0dd4c9ffaabc357960b1b724115d7e0e86a2e1f5";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/dominictarr/through";
      description = "simplified stream construction";
      keywords = [
        "stream"
        "streams"
        "user-streams"
        "pipe"
      ];
    };
  }
