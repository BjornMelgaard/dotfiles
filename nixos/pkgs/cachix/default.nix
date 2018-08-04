{ fetchFromGitHub, lib }:

let
  cachix =
    fetchFromGitHub (
      lib.fetchFromGitHubAttrsFromRevision ./revision.json
    );

in

import cachix {}
