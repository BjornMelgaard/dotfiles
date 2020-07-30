{ fetchFromGitHub, readRevision, addIfdDeps }:

let
  nixpkgs = fetchFromGitHub (
    readRevision ./revision.json
  );

  # nixpkgs = /home/srghma/projects/nixpkgs;

  nixpkgs-with-working-app = import nixpkgs { config = { allowUnfree = true; }; };
in
  {
    dropbox-cli = addIfdDeps [nixpkgs] nixpkgs-with-working-app.dropbox-cli;
    dropbox = addIfdDeps [nixpkgs] nixpkgs-with-working-app.dropbox;
  }
