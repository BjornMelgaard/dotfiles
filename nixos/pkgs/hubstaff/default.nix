{ ... }:
# TODO: https://github.com/NixOS/nixpkgs/issues/38988

let
  nixpkgs = /home/srghma/projects/nixpkgs;

  nixpkgs-with-working-hubstaff = import nixpkgs { config = { allowUnfree = true; }; };
in
  nixpkgs-with-working-hubstaff.hubstaff
