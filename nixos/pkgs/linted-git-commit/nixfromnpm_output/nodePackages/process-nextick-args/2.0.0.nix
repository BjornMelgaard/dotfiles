{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "process-nextick-args";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.0.tgz";
      sha1 = "a37d732f4271b4ab1ad070d35508e8290788ffaa";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/calvinmetcalf/process-nextick-args";
      description = "process.nextTick but always with args";
      author = "";
    };
  }
