{ fetchFromGitHub, pkgs, ... }:
let
  revData = builtins.fromJSON (builtins.readFile ./revision.json);

  url     = revData.url;

  m       = builtins.match "https?://.*/(.*)/(.*)" url;
  owner   = builtins.elemAt m 0;
  repo    = builtins.elemAt m 1;

  src = fetchFromGitHub {
    inherit owner repo;
    inherit (revData) rev sha256;
  };
in
  import src { }
