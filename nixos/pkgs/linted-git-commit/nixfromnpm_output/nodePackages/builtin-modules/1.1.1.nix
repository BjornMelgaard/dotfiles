{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "builtin-modules";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/builtin-modules/-/builtin-modules-1.1.1.tgz";
      sha1 = "270f076c5a72c02f5b65a47df94c5fe3a278892f";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/builtin-modules#readme";
      description = "List of the Node.js builtin modules";
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
      ];
    };
  }
