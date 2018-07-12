# TODO: https://github.com/NixOS/nixpkgs/issues/38988

let
  nixpkgs-with-working-hubstaff =
    import (
      fetchTarball https://github.com/nixos/nixpkgs-channels/archive/nixos-18.03.tar.gz
    ) { config = { allowUnfree = true; }; };

  # to update sha256 use
  # nix-prefetch-url --unpack https://github.com/NixOS/nixpkgs/archive/$rev.tar.gz
  # nixpkgs =
  #   let
  #     rev = "0d499686c6179a782c0995a9704d101dc6e50b52";
  #     sha256 = "1qg4na2grk7dcm75nhnpjxz8fc5mmy08p0jkr88rry197m6hz4gy";
  #   in builtins.fetchTarball {
  #     url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  #     inherit sha256;
  #   };

  # pkgs = import nixpkgs { config = { allowUnfree = true; }; };
in
  # pkgs.hubstaff
  nixpkgs-with-working-hubstaff.hubstaff
