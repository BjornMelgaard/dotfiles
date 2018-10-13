{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "has-flag";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz";
      sha1 = "b5d454dc2199ae225699f3467e5a07f3b955bafd";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/has-flag#readme";
      description = "Check if argv has a specific flag";
      keywords = [
        "has"
        "check"
        "detect"
        "contains"
        "find"
        "flag"
        "cli"
        "command-line"
        "argv"
        "process"
        "arg"
        "args"
        "argument"
        "arguments"
        "getopt"
        "minimist"
        "optimist"
      ];
    };
  }
