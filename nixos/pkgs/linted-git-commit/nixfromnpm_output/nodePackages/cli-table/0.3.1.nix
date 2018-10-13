{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "cli-table";
    version = "0.3.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/cli-table/-/cli-table-0.3.1.tgz";
      sha1 = "f53b05266a8b1a0b934b3d0821e6e2dc5914ae23";
    };
    deps = with nodePackages; [
      colors_1-0-3
    ];
    meta = {
      homepage = "https://github.com/Automattic/cli-table";
      description = "Pretty unicode tables for the CLI";
      keywords = [
        "cli"
        "colors"
        "table"
      ];
    };
  }
