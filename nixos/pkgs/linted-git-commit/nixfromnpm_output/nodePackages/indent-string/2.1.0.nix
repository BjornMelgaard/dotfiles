{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "indent-string";
    version = "2.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/indent-string/-/indent-string-2.1.0.tgz";
      sha1 = "8e2d48348742121b4a8218b7a137e9a52049dc80";
    };
    deps = with nodePackages; [
      repeating_2-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/indent-string#readme";
      description = "Indent each line in a string";
      keywords = [
        "indent"
        "string"
        "str"
        "pad"
        "align"
        "line"
        "text"
      ];
    };
  }
