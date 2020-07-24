{ pkgs, haskellPackages, readRevision, addIfdDeps, ... }:

let
  revisionDataPath = ./revision.json;

  src = pkgs.fetchFromGitHub (
    readRevision revisionDataPath
  );

  # src = /home/srghma/projects/nixfromnpm;

  drv = (import "${src}/release.nix" { }).nixfromnpm;
in
  # drv
  addIfdDeps [src] drv
