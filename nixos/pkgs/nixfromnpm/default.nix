{ pkgs, lib }:

let
  revisionDataPath = ./revision.json;

  src =
    pkgs.fetchFromGitHub (
      lib.fetchFromGitHubAttrsFromRevision revisionDataPath
    );
in

import "${src.outPath}/release.nix" { nixpkgs = <nixpkgs>; }
# pkgs.haskellPackages.callPackage src {}
