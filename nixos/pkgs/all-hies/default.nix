{ lib, callPackage, fetchFromGitHub, readRevision, addAsRuntimeDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);
  # src = fetchTarball "https://github.com/infinisil/all-hies/tarball/master";

  # drv = callPackage src {};
  drv = import src {};
in
  drv
