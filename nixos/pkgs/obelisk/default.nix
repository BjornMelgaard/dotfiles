{ lib, callPackage, fetchFromGitHub, readRevision, addAsRuntimeDeps }:

let
  # src = fetchFromGitHub (readRevision ./revision.json);
  src = fetchTarball "https://github.com/obsidiansystems/obelisk/archive/master.tar.gz";

  # drv = callPackage src {};
  drv = import src {};
in
  drv
