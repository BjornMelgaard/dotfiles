{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "camelcase";
    version = "2.1.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/camelcase/-/camelcase-2.1.1.tgz";
      sha1 = "7c1d16d679a1bbe59ca02cacecfb011e201f5a1f";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/camelcase";
      description = "Convert a dash/dot/underscore/space separated string to camelCase: foo-bar → fooBar";
      keywords = [
        "camelcase"
        "camel-case"
        "camel"
        "case"
        "dash"
        "hyphen"
        "dot"
        "underscore"
        "separator"
        "string"
        "text"
        "convert"
      ];
    };
  }
