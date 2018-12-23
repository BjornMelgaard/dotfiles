{ pkgs, haskellPackages, readRevision, addAsRuntimeDeps, ... }:

let
  revisionDataPath = ./revision.json;

  src = pkgs.fetchFromGitHub (
    readRevision revisionDataPath
  );

  # src = /home/srghma/projects/nixfromnpm;

  drv = (import "${src}/release.nix" { }).nixfromnpm;
in
  # drv
  addAsRuntimeDeps [src] drv
