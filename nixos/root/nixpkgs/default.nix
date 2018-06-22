{ }:

rec {
  config.allowUnfree = true;

  config.packageOverrides = pkgs:
    rec {
      lib = import ../../lib { inherit (pkgs) lib; };

      callPackageFromGithubThatHasDefaultNix = revisionDataPath:
        pkgs.callPackage (
          pkgs.fetchFromGitHub (
            lib.revisionDataFromFile revisionDataPath
          )
        );

      dunsted-volume       = import ../../pkgs/dunsted-volume { inherit callPackageFromGithubThatHasDefaultNix; };
      kb-light             = import ../../pkgs/kb-light { inherit callPackageFromGithubThatHasDefaultNix; };
      randomize_background = import ../../pkgs/randomize_background { inherit callPackageFromGithubThatHasDefaultNix; };

      hubstaff = import ../../pkgs/hubstaff;
    };
}
