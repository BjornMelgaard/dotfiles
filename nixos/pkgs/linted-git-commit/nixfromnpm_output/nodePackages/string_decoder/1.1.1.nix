{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "string_decoder";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz";
      sha1 = "9cf1611ba62685d7030ae9e4ba34149c3af03fc8";
    };
    deps = with nodePackages; [
      safe-buffer_5-1-2
    ];
    meta = {
      homepage = "https://github.com/nodejs/string_decoder";
      description = "The string_decoder module from Node core";
      keywords = [
        "string"
        "decoder"
        "browser"
        "browserify"
      ];
    };
  }
