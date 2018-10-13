{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "yallist";
    version = "2.1.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/yallist/-/yallist-2.1.2.tgz";
      sha1 = "1c11f9218f076089a47dd512f93c6699a6a81d52";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/isaacs/yallist#readme";
      description = "Yet Another Linked List";
    };
  }
