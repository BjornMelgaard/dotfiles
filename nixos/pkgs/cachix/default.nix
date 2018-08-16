{ fetchFromGitHub, lib }:

let
  cachix =
    fetchFromGitHub (
      lib.fetchFromGitHubAttrsFromRevision ./revision.json
    );


  # TODO: add source as buildInput to prevent source from being garbage-collected
in

import cachix {}
