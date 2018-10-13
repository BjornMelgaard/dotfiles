{ pkgs }:

let
  nixfromnpmOutput = import ./nixfromnpm_output { inherit pkgs; };
in
  nixfromnpmOutput.nodePackages.linted-git-commit
