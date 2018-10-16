{ ... }:
# TODO: https://github.com/NixOS/nixpkgs/issues/38988

let
  nixpkgs-with-working-hubstaff = import /home/srghma/projects/nixpkgs/default.nix { config = { allowUnfree = true; }; };
in
  nixpkgs-with-working-hubstaff.hubstaff
