{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "safe-buffer";
    version = "5.1.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz";
      sha1 = "991ec69d296e0313747d59bdfd2b745c35f8828d";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/feross/safe-buffer";
      description = "Safer Node.js Buffer API";
      keywords = [
        "buffer"
        "buffer allocate"
        "node security"
        "safe"
        "safe-buffer"
        "security"
        "uninitialized"
      ];
    };
  }
