{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "error-ex";
    version = "1.3.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/error-ex/-/error-ex-1.3.2.tgz";
      sha1 = "b4ac40648107fdcdcfae242f428bea8a14d4f1bf";
    };
    deps = with nodePackages; [
      is-arrayish_0-2-1
    ];
    meta = {
      homepage = "https://github.com/qix-/node-error-ex#readme";
      description = "Easy error subclassing and stack customization";
      keywords = [
        "error"
        "errors"
        "extend"
        "extending"
        "extension"
        "subclass"
        "stack"
        "custom"
      ];
    };
  }
