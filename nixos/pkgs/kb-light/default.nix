{ callPackage, fetchFromGitHub, readRevision }:

callPackage (
  fetchFromGitHub (
    readRevision ./revision.json
  )
) {}
