{ pkgs, fetchFromGitHub, readRevision, addAsRuntimeDeps, ... }:

let
  src = fetchFromGitHub (
    readRevision ./revision.json
  );

  arionSrc = import src { inherit pkgs; };

  drv = arionSrc.arion;
in
  drv
