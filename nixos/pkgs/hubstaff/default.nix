# TODO: https://github.com/NixOS/nixpkgs/issues/38988

let
  nixpkgs-with-working-hubstaff =
    import (
      fetchTarball https://github.com/nixos/nixpkgs-channels/archive/nixos-18.03.tar.gz
    ) { config = { allowUnfree = true; }; };
in
  nixpkgs-with-working-hubstaff.hubstaff
