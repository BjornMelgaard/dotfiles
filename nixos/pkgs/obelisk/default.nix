{ lib, callPackage, fetchFromGitHub, readRevision, addIfdDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);
  # src = fetchTarball "https://github.com/obsidiansystems/obelisk/archive/master.tar.gz";

  # drv = callPackage src {};
  drv = import src {};
in
  drv
