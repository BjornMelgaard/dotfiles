#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")
nixfromnpm -p linted-git-commit -o "$SCRIPT_DIR/nixfromnpm_output"
