{ lib, callPackage, fetchFromGitHub, readRevision, addAsRuntimeDeps }:

let
  # src = fetchFromGitHub (readRevision ./revision.json);
  src = fetchTarball "https://github.com/target/lorri/archive/rolling-release.tar.gz";

  # drv = callPackage src {};
  # drv = import src {};
in
  src
