{ pkgs, fetchFromGitHub, readRevision, addAsRuntimeDeps }:

let
  src = fetchFromGitHub (readRevision ./revision.json);

  config = { allowUnfree = true; };
  overlays = import "${src}/nix/overlays.nix";
  mypkgs = import pkgs.path { inherit config overlays; };
in
  import src { pkgs = mypkgs; }
