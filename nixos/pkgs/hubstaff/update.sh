#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://github.com/srghma/nixpkgs --rev 8d8f1aa372790d95867d6db94d4754ce6fa01ce2 --no-deepClone > "$SCRIPT_DIR/revision.json"
