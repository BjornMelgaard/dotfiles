{ fetchFromGitHub, readRevision, ... }:

let
  # nixpkgs = fetchFromGitHub (
  #   readRevision ./revision.json
  # );

  nixpkgs = /home/srghma/projects/nixpkgs;

  nixpkgs-with-working-hubstaff = import nixpkgs { config = { allowUnfree = true; }; };
in
  nixpkgs-with-working-hubstaff.hubstaff
