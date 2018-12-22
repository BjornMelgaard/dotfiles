{ callPackage, fetchFromGitHub, readRevision, preventImplicitDepsFromBeingGarbagecollected }:

let
  src = fetchFromGitHub (readRevision ./revision.json);

  drv = callPackage src {};
in
  preventImplicitDepsFromBeingGarbagecollected [src] drv
