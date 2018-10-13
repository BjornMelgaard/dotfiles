{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "conventional-changelog-angular";
    version = "1.6.6";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/conventional-changelog-angular/-/conventional-changelog-angular-1.6.6.tgz";
      sha1 = "b27f2b315c16d0a1f23eb181309d0e6a4698ea0f";
    };
    deps = with nodePackages; [
      q_1-5-1
      compare-func_1-3-2
    ];
    meta = {
      homepage = "https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-angular#readme";
      description = "conventional-changelog angular preset";
      keywords = [
        "conventional-changelog"
        "angular"
        "preset"
      ];
    };
  }
