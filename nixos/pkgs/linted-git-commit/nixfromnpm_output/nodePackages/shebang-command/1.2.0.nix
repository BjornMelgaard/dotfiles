{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "shebang-command";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/shebang-command/-/shebang-command-1.2.0.tgz";
      sha1 = "44aac65b695b03398968c39f363fee5deafdf1ea";
    };
    deps = with nodePackages; [
      shebang-regex_1-0-0
    ];
    meta = {
      homepage = "https://github.com/kevva/shebang-command#readme";
      description = "Get the command from a shebang";
      keywords = [
        "cmd"
        "command"
        "parse"
        "shebang"
      ];
    };
  }
