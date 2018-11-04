{ ... }:

let
  nixpkgs = /home/srghma/projects/nixpkgs;

  pkgs = import nixpkgs { config = { allowUnfree = true; }; };
in
  pkgs.pgFormatter
