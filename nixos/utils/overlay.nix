# it's utils, not lib, because nixpkgs lib doesn't depend on pkgs

pkgs: pkgsOld:

let
  callUtil = file: import file { inherit pkgs; };
in

(callUtil ./readRevision.nix) //
(callUtil ./ifdDeps.nix)
