{ pkgs, haskellPackages, readRevision }:

let
  revisionDataPath = ./revision.json;

  src = pkgs.fetchFromGitHub (
    readRevision revisionDataPath
  );

  # src = /home/srghma/projects/nixfromnpm;
in

(import "${src}/release.nix" { }).nixfromnpm
