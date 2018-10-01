#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://gitlab.com/jD91mZM2/nix-lsp > "$SCRIPT_DIR/revision.json"
