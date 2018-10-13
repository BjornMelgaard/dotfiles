{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "inflight";
    version = "1.0.6";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz";
      sha1 = "49bd6331d7d02d0c09bc910a1075ba8165b56df9";
    };
    deps = with nodePackages; [
      once_1-4-0
      wrappy_1-0-2
    ];
    meta = {
      homepage = "https://github.com/isaacs/inflight";
      description = "Add callbacks to requests in flight to avoid async duplication";
    };
  }
