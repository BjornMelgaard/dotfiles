{ callPackage }:

let
  revisionDataFromFile = path:
  let
    revData = builtins.fromJSON (builtins.readFile path);
  in
  {
    url = revData.url;
    rev = revData.rev;
  };
in

callPackage (
  builtins.fetchGit (
    revisionDataFromFile ./revision.json
  )
) {}
