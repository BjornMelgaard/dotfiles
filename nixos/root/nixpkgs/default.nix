{ pkgs }:

with pkgs;
with callPackage ./lib {};

let
  nixpkgs-local = import /home/bjorn/projects/nixpkgs {};

  # XXX:
  # update command example:
  # nix-prefetch-git https://github.com/BjornMelgaard/dunsted-volume > $DOTFILES/nixos/root/prefetched-git-revisions/dunsted-volume.json
  callPackageFromGithubThatHasDefaultNix = revisionDataPath:
    callPackage (
      fetchFromGitHub (
        revisionDataFromFile revisionDataPath
      )
    );
in

rec {
  config.allowUnfree = true;

  config.packageOverrides = old: {
    # packages from local nixpkgs
    safeeyes = nixpkgs-local.safeeyes;

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
