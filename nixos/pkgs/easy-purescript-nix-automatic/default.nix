{ pkgs, fetchFromGitHub, readRevision, addIfdDeps }:

let
  src = fetchFromGitHub (
    readRevision ./revision.json
  );

  allPackages = import "${src}/default.nix" { inherit pkgs; };
in
  allPackages // {
    spago     = addIfdDeps [src] allPackages.spago;
    purs      = addIfdDeps [src] allPackages.purs;
    purs-0-14 = addIfdDeps [src] allPackages.purs-0-14;
    purty     = addIfdDeps [src] allPackages.purty;
  }
