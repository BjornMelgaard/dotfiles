{ lib, ... }:

rec {
  revisionDataFromFile = path:
  let
    revData = builtins.fromJSON (builtins.readFile path);
    url     = revData.url;

    # test match like `nix-instantiate --eval -E 'builtins.match "https?://.*/(.*)/(.*)" "https://github.com/BjornMelgaard/dunsted-volume"'`
    m       = builtins.match "https?://.*/(.*)/(.*)" url;
    owner   = builtins.elemAt m 0;
    repo    = builtins.elemAt m 1;
  in { inherit owner repo; inherit (revData) rev sha256; };
}
