{ ... }:
# TODO: https://github.com/NixOS/nixpkgs/issues/38988

let
  nixpkgs = builtins.fetchGit {
    url = git://github.com/srghma/nixpkgs;
    rev = "07807d38824a9003439700295a06e9ad9d0cf482";
  };

  nixpkgs-with-working-hubstaff = import nixpkgs { config = { allowUnfree = true; }; };
in
  nixpkgs-with-working-hubstaff.hubstaff
