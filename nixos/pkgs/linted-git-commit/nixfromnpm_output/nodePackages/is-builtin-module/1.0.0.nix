{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-builtin-module";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/is-builtin-module/-/is-builtin-module-1.0.0.tgz";
      sha1 = "540572d34f7ac3119f8f76c30cbc1b1e037affbe";
    };
    deps = with nodePackages; [
      builtin-modules_1-1-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/is-builtin-module";
      description = "Check if a string matches the name of a Node.js builtin module";
      keywords = [
        "builtin"
        "built-in"
        "builtins"
        "node"
        "modules"
        "core"
        "bundled"
        "list"
        "array"
        "names"
        "is"
        "detect"
        "check"
        "match"
      ];
    };
  }
