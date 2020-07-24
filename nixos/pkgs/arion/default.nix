{ pkgs, fetchFromGitHub, readRevision, addIfdDeps, ... }:

let
  src = fetchFromGitHub (
    readRevision ./revision.json
  );

  arionSrc = import src { inherit pkgs; };

  drv = arionSrc.arion;
in
  drv
