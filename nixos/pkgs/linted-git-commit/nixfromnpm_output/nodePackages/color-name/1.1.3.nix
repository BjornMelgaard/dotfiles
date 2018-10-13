{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "color-name";
    version = "1.1.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz";
      sha1 = "a7d0558bd89c42f795dd42328f740831ca53bc25";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://github.com/dfcreative/color-name";
      description = "A list of color names and its values";
      keywords = [
        "color-name"
        "color"
        "color-keyword"
        "keyword"
      ];
    };
  }
