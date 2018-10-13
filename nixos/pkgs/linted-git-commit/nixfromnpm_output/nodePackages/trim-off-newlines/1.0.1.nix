{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "trim-off-newlines";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/trim-off-newlines/-/trim-off-newlines-1.0.1.tgz";
      sha1 = "9f9ba9d9efa8764c387698bcbfeb2c848f11adb3";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/stevemao/trim-off-newlines#readme";
      description = "Similar to String#trim() but removes only newlines";
      keywords = [
        "trim"
        "newlines"
        "new-lines"
        "newline"
        "new-lines"
        "string"
        "str"
        "util"
        "utils"
        "utility"
        "whitespace"
        "space"
        "remove"
        "delete"
      ];
    };
  }
