{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "esprima";
    version = "4.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz";
      sha1 = "13b04cdb3e6c5d19df91ab6987a8695619b0aa71";
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
