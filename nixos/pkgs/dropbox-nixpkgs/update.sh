#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://github.com/srghma/nixpkgs --rev 36c772b5f3b79c6831427edb3bc4e61c72316bec --no-deepClone > "$SCRIPT_DIR/revision.json"
