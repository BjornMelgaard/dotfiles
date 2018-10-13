{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "cross-spawn";
    version = "5.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/cross-spawn/-/cross-spawn-5.1.0.tgz";
      sha1 = "e8bd0efee58fcff6f8f94510a0a554bbfa235449";
    };
    deps = with nodePackages; [
      which_1-3-1
      lru-cache_4-1-3
      shebang-command_1-2-0
    ];
    meta = {
      homepage = "https://github.com/IndigoUnited/node-cross-spawn#readme";
      description = "Cross platform child_process#spawn and child_process#spawnSync";
      keywords = [
        "spawn"
        "spawnSync"
        "windows"
        "cross"
        "platform"
        "path"
        "ext"
        "path-ext"
        "path_ext"
        "shebang"
        "hashbang"
        "cmd"
        "execute"
      ];
    };
  }
