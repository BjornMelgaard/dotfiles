{ lib, callPackage, fetchFromGitHub, readRevision, addAsRuntimeDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);

  drv = callPackage src {};
in
  drv
