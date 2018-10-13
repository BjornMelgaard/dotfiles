{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "path-key";
    version = "2.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/path-key/-/path-key-2.0.1.tgz";
      sha1 = "411cadb574c5a140d3a4b1910d40d80cc9f40b40";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/path-key#readme";
      description = "Get the PATH environment variable key cross-platform";
      keywords = [
        "path"
        "key"
        "environment"
        "env"
        "variable"
        "var"
        "get"
        "cross-platform"
        "windows"
      ];
    };
  }
