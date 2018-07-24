{ pkgs, haskellPackages, lib }:

let
  revisionDataPath = ./revision.json;

  src = pkgs.fetchFromGitHub (
    lib.fetchFromGitHubAttrsFromRevision revisionDataPath
  );

  # src = /home/srghma/projects/nixfromnpm;
in

(import "${src}/release.nix" { }).nixfromnpm
