{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "redeyed";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/redeyed/-/redeyed-1.0.1.tgz";
      sha1 = "e96c193b40c0816b00aec842698e61185e55498a";
    };
    deps = with nodePackages; [
      esprima_3-0-0
    ];
    meta = {
      homepage = "https://github.com/thlorenz/redeyed#readme";
      description = "Takes JavaScript code, along with a config and returns the original code with tokens wrapped as configured.";
      keywords = [
        "ast"
        "syntax"
        "tree"
        "source"
        "wrap"
        "metadata"
      ];
    };
  }
