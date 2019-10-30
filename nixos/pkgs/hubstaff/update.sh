#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://github.com/NixOS/nixpkgs --rev 66b7ad13c9c65fdd7610e564fcc82fe5eea8aaf6 --no-deepClone > "$SCRIPT_DIR/revision.json"
