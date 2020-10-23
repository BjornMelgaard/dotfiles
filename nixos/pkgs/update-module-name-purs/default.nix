{ pkgs, fetchFromGitHub, readRevision, addIfdDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);

  config = { allowUnfree = true; };
  overlays = import "${src}/nix/overlays.nix";
  mypkgs = import pkgs.path { inherit config overlays; };

  drv = import src { pkgs = mypkgs; };
in
  addIfdDeps [src] drv
