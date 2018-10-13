{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "marked";
    version = "0.3.19";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/marked/-/marked-0.3.19.tgz";
      sha1 = "5d47f709c4c9fc3c216b6d46127280f40b39d790";
    };
    deps = [];
    meta = {
      homepage = "https://marked.js.org";
      description = "A markdown parser built for speed";
      keywords = [
        "markdown"
        "markup"
        "html"
      ];
    };
  }
