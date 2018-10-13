{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "strip-indent";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/strip-indent/-/strip-indent-1.0.1.tgz";
      sha1 = "0c7962a6adefa7bbd4ac366460a638552ae1a0a2";
    };
    deps = with nodePackages; [
      get-stdin_4-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/strip-indent";
      description = "Strip leading whitespace from every line in a string";
      keywords = [
        "cli"
        "bin"
        "browser"
        "strip"
        "normalize"
        "remove"
        "indent"
        "indentation"
        "whitespace"
        "space"
        "tab"
        "string"
        "str"
      ];
    };
  }
