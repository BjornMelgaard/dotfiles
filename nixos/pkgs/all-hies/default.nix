{ lib, callPackage, fetchFromGitHub, readRevision, addIfdDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);
  # src = fetchTarball "https://github.com/infinisil/all-hies/tarball/master";

  # drv = callPackage src {};
  allPackages = import src {};
in
  {
    latest = addIfdDeps [src] allPackages.latest;
  }
