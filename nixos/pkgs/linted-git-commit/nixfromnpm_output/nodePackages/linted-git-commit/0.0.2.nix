{ buildNodePackage, namespaces, nodePackages, pkgs }:
buildNodePackage {
    name = "linted-git-commit";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/linted-git-commit/-/linted-git-commit-0.0.2.tgz";
      sha1 = "80b15e5b7a46fdca8f7cd44393cf28d999fc50a2";
    };
    deps = with nodePackages; [
      namespaces.commitlint.core_4-3-0
      ramda-adjunct_2-10-0
      cosmiconfig_3-1-0
      dedent_0-7-0
      ramda_0-25-0
      marked_0-3-19
      chalk_2-4-1
      marked-terminal_2-0-0
      execa_0-8-0
    ];
    meta = {
      homepage = "https://github.com/BjornMelgaard/linted-git-commit#readme";
      description = "Lint commit message using commitlint, commit if message is valid, show useful info about your config on -h flag";
      keywords = [
        "commitlint"
        "git"
        "commit"
        "lint"
      ];
    };
  }
