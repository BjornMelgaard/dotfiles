{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "ramda-adjunct";
    version = "2.10.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/ramda-adjunct/-/ramda-adjunct-2.10.0.tgz";
      sha1 = "94fbb3377a6ef01e6be869a0c2c236ba66393708";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/char0n/ramda-adjunct";
      description = "Ramda Adjunct is the most popular and most comprehensive set of utilities for use with Ramda, providing a variety of useful, well tested functions with excellent documentation.";
      keywords = [
        "ramda"
        "utils"
        "utilities"
        "toolkit"
        "extensions"
        "addons"
        "adjunct"
        "recipes"
        "extras"
        "cookbook"
        "functional"
      ];
    };
  }
