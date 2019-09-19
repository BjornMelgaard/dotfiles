#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://github.com/NixOS/nixpkgs --rev 07d78691da23038caef6c7c23c6565c731c72cec --no-deepClone > "$SCRIPT_DIR/revision.json"
