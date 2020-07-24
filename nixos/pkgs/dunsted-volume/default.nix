{ callPackage, fetchFromGitHub, readRevision, addIfdDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);

  drv = callPackage src {};
in
  addIfdDeps [src] drv
