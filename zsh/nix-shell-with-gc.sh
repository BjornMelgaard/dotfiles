# Executes nix-shell with side-effect of adding nix-shell dependencies to gc-root
# (to prevent dependencies from being garbage-collected on next gc run)
#
# Usage:
# ./dev-shell
# ./dev-shell --command 'nixform apply'
# ./dev-shell --command 'srghma_gitlab_runner_ssh -t "journalctl --catalog --pager-end --follow"'

nix-shell-with-gc () {
  set -e

  shell_file=$(test -f ./shell.nix && echo "shell.nix" || echo "default.nix")

  mkdir -p .gcroots

  # add shell as gc-root in /nix/var/nix/gcroots/auto
  nix-instantiate $shell_file --indirect --add-root $PWD/.gcroots/shell.drv

  # add shell dependencies as gc-root in /nix/var/nix/gcroots/auto
  # NOTE: one can use keep-outputs=true in /etc/nix/nix.conf and omit this step (https://github.com/NixOS/nix/issues/2208)
  nix-store --indirect --add-root $PWD/.gcroots/shell.dep --realise $(nix-store --query --references $PWD/.gcroots/shell.drv)

  exec nix-shell $(readlink $PWD/.gcroots/shell.drv) "$@"
}
