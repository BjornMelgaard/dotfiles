{ buildNodePackage, fetchUrlNamespaced, namespaceTokens, nodePackages, pkgs }:
buildNodePackage {
    name = "git-raw-commits";
    version = "1.2.0";
    src = fetchUrlNamespaced {
      url = "https://registry.npmjs.org/@marionebl/git-raw-commits/-/git-raw-commits-1.2.0.tgz";
      sha1 = "7cd8a6dfc09a96df98d8fbe9175c5971cc07c82b";
      namespace = "marionebl";
    };
    namespace = "marionebl";
    deps = with nodePackages; [
      split2_2-2-0
      through2_2-0-3
      dargs_4-1-0
      meow_3-7-0
      lodash-template_4-4-0
    ];
    meta = {
      homepage = "https://github.com/conventional-changelog/git-latest-tag";
      description = "Get raw git commits out of your repository using git-log(1)";
      keywords = [
        "git-raw-commits"
        "raw"
        "commit"
        "commits"
        "git"
        "log"
        "git-log"
      ];
    };
  }
