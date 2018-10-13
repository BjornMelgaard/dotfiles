{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "find-up";
    version = "2.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/find-up/-/find-up-2.1.0.tgz";
      sha1 = "45d1b7e506c717ddd482775a2b77920a3c0c57a7";
    };
    deps = with nodePackages; [
      locate-path_2-0-0
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/find-up#readme";
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
