{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "read-pkg-up";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/read-pkg-up/-/read-pkg-up-1.0.1.tgz";
      sha1 = "9d63c13276c065918d57f002a57f40a1b643fb02";
    };
    deps = with nodePackages; [
      find-up_1-1-2
      read-pkg_1-1-0
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/read-pkg-up";
      description = "Read the closest package.json file";
      keywords = [
        "json"
        "read"
        "parse"
        "file"
        "fs"
        "graceful"
        "load"
        "pkg"
        "package"
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
