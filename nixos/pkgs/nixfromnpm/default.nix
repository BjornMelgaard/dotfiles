{ pkgs, haskellPackages, lib }:

let
  src = /home/srghma/projects/nixfromnpm;
in

(import "${src}/release.nix" { }).nixfromnpm
