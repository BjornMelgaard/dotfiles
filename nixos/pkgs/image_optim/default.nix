{ fetchFromGitHub, readRevision, ... }:

let
  src = fetchFromGitHub (
    readRevision ./revision.json
  );
in
  src
