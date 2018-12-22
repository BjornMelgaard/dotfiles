{ pkgs, haskellPackages, readRevision, preventImplicitDepsFromBeingGarbagecollected, ... }:

let
  revisionDataPath = ./revision.json;

  src = pkgs.fetchFromGitHub (
    readRevision revisionDataPath
  );

  # src = /home/srghma/projects/nixfromnpm;

  drv = (import "${src}/release.nix" { }).nixfromnpm;
in
  # drv
  preventImplicitDepsFromBeingGarbagecollected [src] drv
