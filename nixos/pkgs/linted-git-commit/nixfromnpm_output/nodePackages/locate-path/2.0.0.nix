{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "locate-path";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/locate-path/-/locate-path-2.0.0.tgz";
      sha1 = "2b568b265eec944c6d9c0de9c3dbbbca0354cd8e";
    };
    deps = with nodePackages; [
      p-locate_2-0-0
      path-exists_3-0-0
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/locate-path#readme";
      description = "Get the first path that exists on disk of multiple paths";
      keywords = [
        "locate"
        "path"
        "paths"
        "file"
        "files"
        "exists"
        "find"
        "finder"
        "search"
        "searcher"
        "array"
        "iterable"
        "iterator"
      ];
    };
  }
