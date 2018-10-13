{ pkgs, ... }:

with pkgs;
with lib;

{
  # How this works:
  # this function adds txt file, containing paths to dependencies (/nix/store/HASH-name) to build dependencies of derivation

  # Why this works:

  # Inspiration taken from:
  # https://github.com/NixOS/nixpkgs/blob/ca3f3897e9c521b93fa6202a3693c4e31d08bbbb/pkgs/build-support/replace-dependency.nix#L64-L70
  # https://github.com/michalrus/kornel/blob/b468334cd5ad18b9b94fbebe274d1d8e33ec955f/default.nix#L76

  # https://github.com/NixOS/nix/issues/954#issuecomment-365308061

  # TODO
  preventImplicitDepsFromBeingGarbagecollected = implicitDeps: drv:
    let
      fileWithLinks = writeText "fileWithLinks" (
        concatMapStringsSep "\n" toString implicitDeps + "\n"
      );
    in
      overrideDerivation drv (oldAttrs: {
        buildInputs = [ fileWithLinks ] ++ oldAttrs.buildInputs;
      });
}
