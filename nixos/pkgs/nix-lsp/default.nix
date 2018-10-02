{
  # fetchFromGitLab,
}:

let
  # revData = builtins.fromJSON (builtins.readFile ./revision.json);

  # url     = revData.url;

  # m       = builtins.match "https?://.*/(.*)/(.*)" url;
  # owner   = builtins.elemAt m 0;
  # repo    = builtins.elemAt m 1;

  # src = fetchFromGitLab {
  #   inherit owner repo;
  #   inherit (revData) rev sha256;
  # };

  src = /home/srghma/projects/nix-lsp;
in

import "${src}/default.nix" {}
