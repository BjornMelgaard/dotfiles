{ pkgs, haskellPackages, fetchFromGitHubAttrsFromRevision }:

let
  revisionDataPath = ./revision.json;

  src = pkgs.fetchFromGitHub (
    fetchFromGitHubAttrsFromRevision revisionDataPath
  );

  # src = /home/srghma/projects/nixfromnpm;
in

(import "${src}/release.nix" { }).nixfromnpm
