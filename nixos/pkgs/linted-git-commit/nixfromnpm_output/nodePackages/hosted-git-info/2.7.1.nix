{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "hosted-git-info";
    version = "2.7.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/hosted-git-info/-/hosted-git-info-2.7.1.tgz";
      sha1 = "97f236977bd6e125408930ff6de3eec6281ec047";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/npm/hosted-git-info";
      description = "Provides metadata and conversions from repository urls for Github, Bitbucket and Gitlab";
      keywords = [
        "git"
        "github"
        "bitbucket"
        "gitlab"
      ];
    };
  }
