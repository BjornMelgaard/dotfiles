{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "p-locate";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/p-locate/-/p-locate-2.0.0.tgz";
      sha1 = "20a0103b222a70c8fd39cc2e580680f3dde5ec43";
    };
    deps = with nodePackages; [
      p-limit_1-3-0
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/p-locate#readme";
      description = "Get the first fulfilled promise that satisfies the provided testing function";
      keywords = [
        "promise"
        "locate"
        "find"
        "finder"
        "search"
        "searcher"
        "test"
        "array"
        "collection"
        "iterable"
        "iterator"
        "race"
        "fulfilled"
        "fastest"
        "async"
        "await"
        "promises"
        "bluebird"
      ];
    };
  }
