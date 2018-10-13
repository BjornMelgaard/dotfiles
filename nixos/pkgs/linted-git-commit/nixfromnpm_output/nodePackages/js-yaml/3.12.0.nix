{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "js-yaml";
    version = "3.12.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/js-yaml/-/js-yaml-3.12.0.tgz";
      sha1 = "eaed656ec8344f10f527c6bfa1b6e2244de167d1";
    };
    deps = with nodePackages; [
      esprima_4-0-1
      argparse_1-0-10
    ];
    meta = {
      homepage = "https://github.com/nodeca/js-yaml";
      description = "YAML 1.2 parser and serializer";
      keywords = [
        "yaml"
        "parser"
        "serializer"
        "pyyaml"
      ];
    };
  }
