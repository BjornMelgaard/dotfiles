#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix-prefetch-git

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nix-prefetch-git https://github.com/NixOS/nixpkgs --rev 4a3a31be57a363f24de1e69410433c7e3edc8a76 --no-deepClone > "$SCRIPT_DIR/revision.json"
