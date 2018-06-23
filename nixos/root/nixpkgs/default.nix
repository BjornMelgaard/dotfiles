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

      dunsted-volume       = pkgs.callPackage ../../pkgs/dunsted-volume {};
      kb-light             = pkgs.callPackage ../../pkgs/kb-light {};
      randomize_background = pkgs.callPackage ../../pkgs/randomize_background {};
      switch_touchpad      = pkgs.callPackage ../../pkgs/switch_touchpad {};
      tmuxx                = pkgs.callPackage ../../pkgs/tmuxx {};

      hubstaff = import ../../pkgs/hubstaff;
    };
}
