{ pkgs, ... }:

with pkgs;

{
  addIfdDeps = deps: drv:
    drv.overrideAttrs (old: {
      passthru = (if old ? passthru then old.passthru else {}) // {
        ifdDependencies = deps;
      };
    });

  collectIfdDepsToTextFile = drvs:
    let
      getDeps = lib.attrByPath ["passthru" "ifdDependencies"] null;

      drvDeps = builtins.map getDeps drvs;

      drvDeps' = lib.unique (lib.flatten (lib.remove null drvDeps));
    in
      pkgs.writeText "ifd-deps" (lib.concatStringsSep "\n" drvDeps');
}
