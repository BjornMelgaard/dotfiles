{ pkgs, config }:

with pkgs;
with callPackage ./lib { };

let
  # pass config so that packages use correct allowUnfree for example
  nixpkgs-local = import ../lib/nixpkgs-local.nix;
in

rec {
  config.allowUnfree = true;

  config.packageOverrides = old: {
    # packages from local nixpkgs
    inherit (nixpkgs-local) safeeyes;

    # My remote packages
    dunsted-volume =
      callPackageFromGithubThatHasDefaultNix
      ./prefetched-git-revisions/dunsted-volume.json
      {};

    randomize_background =
      callPackageFromGithubThatHasDefaultNix
      ./prefetched-git-revisions/randomize_background.json
      {};

    kb-light =
      callPackageFromGithubThatHasDefaultNix
      ./prefetched-git-revisions/kb-light.json
      {};

  };
}
