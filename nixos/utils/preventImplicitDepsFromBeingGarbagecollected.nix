{ pkgs, ... }:

with pkgs;
with lib;

{
  # How this works:
  # this function adds txt file, containing paths to dependencies (/nix/store/HASH-name) to build dependencies of derivation

  # Why this works:

  # Inspiration taken from:
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/replace-dependency.nix#L64-L70

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
