{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "dargs";
    version = "4.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/dargs/-/dargs-4.1.0.tgz";
      sha1 = "03a9dbb4b5c2f139bf14ae53f0b8a2a6a86f4e17";
    };
    deps = with nodePackages; [
      number-is-nan_1-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/dargs";
      description = "Reverse minimist. Convert an object of options into an array of command-line arguments.";
      keywords = [
        "options"
        "arguments"
        "args"
        "flags"
        "cli"
        "nopt"
        "minimist"
        "bin"
        "binary"
        "command"
        "cmd"
        "reverse"
        "inverse"
        "opposite"
        "invert"
        "switch"
        "construct"
        "parse"
        "parser"
        "argv"
      ];
    };
  }
