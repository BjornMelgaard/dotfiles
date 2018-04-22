# TODO: https://github.com/NixOS/nixpkgs/issues/38988

import (
fetchTarball https://github.com/nixos/nixpkgs-channels/archive/nixos-18.03.tar.gz
) { config = { allowUnfree = true; }; }
