{ buildNodePackage, fetchUrlNamespaced, namespaceTokens, namespaces, nodePackages, pkgs }:
buildNodePackage {
    name = "core";
    version = "4.3.0";
    src = fetchUrlNamespaced {
      url = "https://registry.npmjs.org/@commitlint/core/-/core-4.3.0.tgz";
      sha1 = "e881a0a16594af3ade09be4d12b770b9913bc261";
      namespace = "commitlint";
    };
    namespace = "commitlint";
    deps = with nodePackages; [
      lodash_4-17-11
      namespaces.marionebl.conventional-commits-parser_3-0-0
      conventional-changelog-angular_1-6-6
      resolve-from_3-0-0
      path-exists_3-0-0
      cosmiconfig_3-1-0
      babel-runtime_6-26-0
      namespaces.marionebl.sander_0-6-1
      namespaces.marionebl.git-raw-commits_1-2-0
      chalk_2-4-1
      find-up_2-1-0
      semver_5-6-0
    ];
    meta = {
      homepage = "https://github.com/marionebl/commitlint#readme";
      description = "Lint your commit messages";
      keywords = [
        "conventional-changelog"
        "commitlint"
        "library"
        "core"
      ];
    };
  }
