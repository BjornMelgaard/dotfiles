{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "repeating";
    version = "2.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/repeating/-/repeating-2.0.1.tgz";
      sha1 = "5214c53a926d3552707527fbab415dbc08d06dda";
    };
    deps = with nodePackages; [
      is-finite_1-0-2
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/repeating#readme";
      description = "Repeat a string - fast";
      keywords = [
        "repeat"
        "string"
        "repeating"
        "str"
        "text"
        "fill"
        "pad"
      ];
    };
  }
