{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "minimatch";
    version = "3.0.4";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz";
      sha1 = "5166e286457f03306064be5497e8dbb0c3d32083";
    };
    deps = with nodePackages; [
      brace-expansion_1-1-11
    ];
    meta = {
      homepage = "https://github.com/isaacs/minimatch#readme";
      description = "a glob matcher in javascript";
    };
  }
