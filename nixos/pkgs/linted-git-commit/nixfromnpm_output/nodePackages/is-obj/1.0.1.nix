{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-obj";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/is-obj/-/is-obj-1.0.1.tgz";
      sha1 = "3e4729ac1f5fde025cd7d83a896dab9f4f67db0f";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/is-obj#readme";
      description = "Check if a value is an object";
      keywords = [
        "obj"
        "object"
        "is"
        "check"
        "test"
        "type"
      ];
    };
  }
