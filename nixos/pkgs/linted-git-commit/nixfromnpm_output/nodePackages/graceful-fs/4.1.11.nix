{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "graceful-fs";
    version = "4.1.11";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.1.11.tgz";
      sha1 = "0e8bdfe4d1ddb8854d64e04ea7c00e2a026e5658";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/isaacs/node-graceful-fs#readme";
      description = "A drop-in replacement for fs, making various improvements.";
      keywords = [
        "fs"
        "module"
        "reading"
        "retry"
        "retries"
        "queue"
        "error"
        "errors"
        "handling"
        "EMFILE"
        "EAGAIN"
        "EINVAL"
        "EPERM"
        "EACCESS"
      ];
    };
  }
