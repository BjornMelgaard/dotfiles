{ fetchFromGitHub, readRevision, preventImplicitDepsFromBeingGarbagecollected, ... }:

let
  src = fetchFromGitHub (
    readRevision ./revision.json
  );

  drv = import src {};
in
  # TODO
  # preventImplicitDepsFromBeingGarbagecollected [src] drv
  drv
