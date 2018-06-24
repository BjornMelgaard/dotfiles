{ lib }:

# TODO: use `lib.extend` after update
# https://github.com/NixOS/nixpkgs/commit/e1dee4efcbffc72260025078bf8297a3b732509c#diff-a013e20924130857c649dd17226282ff

lib // (
let
  callLibs = file: import file { inherit lib; };

in
  (callLibs ./fetchFromGitHubAttrsFromRevision.nix)
)
