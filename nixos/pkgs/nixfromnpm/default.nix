{ pkgs, haskellPackages, lib }:

let
  revisionDataPath = ./revision.json;

  src =
    pkgs.fetchFromGitHub (
      lib.fetchFromGitHubAttrsFromRevision revisionDataPath
    );

  overridedHaskellPackages = haskellPackages.override {
    overrides = self: super: {
      semver-range =
        self.callPackage "${src.outPath}/nix/semver-range.nix" { };

      text-render =
        self.callPackage "${src.outPath}/nix/text-render.nix" { };

      nixfromnpm = self.callPackage src { };
    };
  };
in

overridedHaskellPackages.nixfromnpm
