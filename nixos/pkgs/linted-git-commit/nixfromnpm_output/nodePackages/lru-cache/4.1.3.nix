{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "lru-cache";
    version = "4.1.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/lru-cache/-/lru-cache-4.1.3.tgz";
      sha1 = "a1175cf3496dfc8436c156c334b4955992bce69c";
    };
    deps = with nodePackages; [
      pseudomap_1-0-2
      yallist_2-1-2
    ];
    meta = {
      homepage = "https://github.com/isaacs/node-lru-cache#readme";
      description = "A cache object that deletes the least-recently-used items.";
      keywords = [
        "mru"
        "lru"
        "cache"
      ];
    };
  }
