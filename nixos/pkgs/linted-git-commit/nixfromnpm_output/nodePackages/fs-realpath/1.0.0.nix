{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "fs.realpath";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
      sha1 = "1504ad2523158caa40db4a2787cb01411994ea4f";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://github.com/isaacs/fs.realpath#readme";
      description = "Use node's fs.realpath, but fall back to the JS implementation if the native one fails";
      keywords = [
        "realpath"
        "fs"
        "polyfill"
      ];
    };
  }
