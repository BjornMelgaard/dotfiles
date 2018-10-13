{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "esprima";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/esprima/-/esprima-3.0.0.tgz";
      sha1 = "53cf247acda77313e551c3aa2e73342d3fb4f7d9";
    };
    deps = [];
    meta = {
      homepage = "http://esprima.org";
      description = "ECMAScript parsing infrastructure for multipurpose analysis";
      keywords = [
        "ast"
        "ecmascript"
        "esprima"
        "javascript"
        "parser"
        "syntax"
      ];
    };
  }
