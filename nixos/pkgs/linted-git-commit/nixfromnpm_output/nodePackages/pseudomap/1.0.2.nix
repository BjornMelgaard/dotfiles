{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "pseudomap";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/pseudomap/-/pseudomap-1.0.2.tgz";
      sha1 = "f052a28da70e618917ef0a8ac34c1ae5a68286b3";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/isaacs/pseudomap#readme";
      description = "A thing that is a lot like ES6 `Map`, but without iterators, for use in environments where `for..of` syntax and `Map` are not available.";
    };
  }
