{ lib, callPackage, fetchFromGitHub, readRevision, addIfdDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);
  # src = fetchTarball "https://github.com/target/lorri/archive/rolling-release.tar.gz";

  # drv = callPackage src {};
  drv = import src {};
in
  addIfdDeps [src] drv
