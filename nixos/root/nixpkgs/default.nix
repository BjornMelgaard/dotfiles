{ ... }:

rec {
  config.allowUnfree = true;

  config.packageOverrides = pkgs:
    rec {
      lib = import ../../lib { inherit (pkgs) lib; };

      pkgsLocal = import /home/srghma/projects/nixpkgs { config = { allowUnfree = true; }; };

      callPackageFromGithubThatHasDefaultNix = revisionDataPath:
        pkgs.callPackage (
          pkgs.fetchFromGitHub (
            lib.fetchFromGitHubAttrsFromRevision revisionDataPath
          )
        );

      dunsted-volume        = pkgs.callPackage ../../pkgs/dunsted-volume {};
      kb-light              = pkgs.callPackage ../../pkgs/kb-light {};
      randomize_background  = pkgs.callPackage ../../pkgs/randomize_background {};
      switch_touchpad       = pkgs.callPackage ../../pkgs/switch_touchpad {};
      tmuxx                 = pkgs.callPackage ../../pkgs/tmuxx {};
      umsf                  = pkgs.callPackage ../../pkgs/umsf {};
      cachix                = pkgs.callPackage ../../pkgs/cachix {};
      fix_github_https_repo = pkgs.callPackage ../../pkgs/fix_github_https_repo {};
      nixfmt                = pkgs.haskellPackages.callPackage ../../pkgs/nixfmt {};
      nix-lsp               = pkgs.haskellPackages.callPackage ../../pkgs/nix-lsp {};

      hubstaff = import ../../pkgs/hubstaff;

      # haskellPackages = pkgs.haskellPackages.override {
      #   overrides = self: super: {
      #     nixfromnpm = self.callPackage ../../pkgs/nixfromnpm { };
      #   };
      # };
    };
}
