{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "resolve-from";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/resolve-from/-/resolve-from-3.0.0.tgz";
      sha1 = "b22c7af7d9d6881bc8b6e653335eebcb0a188748";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/resolve-from#readme";
      description = "Resolve the path of a module like `require.resolve()` but from a given path";
      keywords = [
        "require"
        "resolve"
        "path"
        "module"
        "from"
        "like"
        "import"
        "path"
      ];
    };
  }
