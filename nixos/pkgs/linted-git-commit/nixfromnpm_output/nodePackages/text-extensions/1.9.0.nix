{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "text-extensions";
    version = "1.9.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/text-extensions/-/text-extensions-1.9.0.tgz";
      sha1 = "1853e45fee39c945ce6f6c36b2d659b5aabc2a26";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/text-extensions#readme";
      description = "List of text file extensions";
      keywords = [
        "text"
        "ascii"
        "ext"
        "extensions"
        "extension"
        "file"
        "json"
        "list"
        "array"
      ];
    };
  }
