#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://github.com/srghma/nixpkgs --rev 7f88d0feb7a049de8eaf701f1d39e920c47306b1 --no-deepClone > "$SCRIPT_DIR/revision.json"
