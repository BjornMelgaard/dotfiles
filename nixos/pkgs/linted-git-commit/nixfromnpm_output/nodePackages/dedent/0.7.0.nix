{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "dedent";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/dedent/-/dedent-0.7.0.tgz";
      sha1 = "2495ddbaf6eb874abb0e1be9df22d2e5a544326c";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/dmnd/dedent";
      description = "An ES6 string tag that strips indentation from multi-line strings";
      keywords = [
        "dedent"
        "tag"
        "multi-line string"
        "es6"
      ];
    };
  }
