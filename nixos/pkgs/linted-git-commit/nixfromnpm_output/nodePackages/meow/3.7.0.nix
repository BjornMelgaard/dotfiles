{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "meow";
    version = "3.7.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/meow/-/meow-3.7.0.tgz";
      sha1 = "72cb668b425228290abbfa856892587308a801fb";
    };
    deps = with nodePackages; [
      redent_1-0-0
      trim-newlines_1-0-0
      minimist_1-2-0
      decamelize_1-2-0
      read-pkg-up_1-0-1
      map-obj_1-0-1
      normalize-package-data_2-4-0
      loud-rejection_1-6-0
      object-assign_4-1-1
      camelcase-keys_2-1-0
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/meow#readme";
      description = "CLI app helper";
      keywords = [
        "cli"
        "bin"
        "util"
        "utility"
        "helper"
        "argv"
        "command"
        "line"
        "meow"
        "cat"
        "kitten"
        "parser"
        "option"
        "flags"
        "input"
        "cmd"
        "console"
      ];
    };
  }
