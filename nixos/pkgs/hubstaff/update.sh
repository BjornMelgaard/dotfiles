#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://github.com/srghma/nixpkgs --rev 004b3125975c9eb501938cee515e2016402fff2e --no-deepClone > "$SCRIPT_DIR/revision.json"
