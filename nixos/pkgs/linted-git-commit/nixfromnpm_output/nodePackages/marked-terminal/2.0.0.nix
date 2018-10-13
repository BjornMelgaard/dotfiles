{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "marked-terminal";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/marked-terminal/-/marked-terminal-2.0.0.tgz";
      sha1 = "5eaf568be66f686541afa52a558280310a31de2d";
    };
    deps = with nodePackages; [
      cli-table_0-3-1
      lodash-assign_4-2-0
      chalk_1-1-3
      cardinal_1-0-0
      node-emoji_1-8-1
    ];
    meta = {
      homepage = "https://github.com/mikaelbr/marked-terminal";
      description = "A custom render for marked to output to the Terminal";
      keywords = [
        "marked"
        "render"
        "terminal"
        "markdown"
        "markdown-to-terminal"
      ];
    };
  }
