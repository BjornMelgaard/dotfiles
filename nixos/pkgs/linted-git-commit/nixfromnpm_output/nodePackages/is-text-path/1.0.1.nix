{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-text-path";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/is-text-path/-/is-text-path-1.0.1.tgz";
      sha1 = "4e1aa0fb51bfbcb3e92688001397202c1775b66e";
    };
    deps = with nodePackages; [
      text-extensions_1-9-0
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/is-text-path";
      description = "Check if a filepath is a text file";
      keywords = [
        "txt"
        "text"
        "ext"
        "extensions"
        "extension"
        "file"
        "path"
        "check"
        "detect"
        "is"
      ];
    };
  }
