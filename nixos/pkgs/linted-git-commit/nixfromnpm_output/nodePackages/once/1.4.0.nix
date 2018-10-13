{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "once";
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
      sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
    };
    deps = with nodePackages; [
      wrappy_1-0-2
    ];
    meta = {
      homepage = "https://github.com/isaacs/once#readme";
      description = "Run a function exactly one time";
      keywords = [
        "once"
        "function"
        "one"
        "single"
      ];
    };
  }
