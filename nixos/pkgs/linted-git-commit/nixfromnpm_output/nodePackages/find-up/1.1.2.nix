{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "find-up";
    version = "1.1.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/find-up/-/find-up-1.1.2.tgz";
      sha1 = "6b2e9822b1a2ce0a60ab64d610eccad53cb24d0f";
    };
    deps = with nodePackages; [
      path-exists_2-1-0
      pinkie-promise_2-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/find-up";
      description = "Find a file by walking up parent directories";
      keywords = [
        "find"
        "up"
        "find-up"
        "findup"
        "look-up"
        "look"
        "file"
        "search"
        "match"
        "package"
        "resolve"
        "parent"
        "parents"
        "folder"
        "directory"
        "dir"
        "walk"
        "walking"
        "path"
      ];
    };
  }
