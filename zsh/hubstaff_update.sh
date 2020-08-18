hubstaff_update () {
  set -e

  cd $HOME/projects/nixpkgs

  git checkout hubstaff_update

  old_v=$(cat ./pkgs/applications/misc/hubstaff/revision.json | jq -r .version)

  ./pkgs/applications/misc/hubstaff/update.sh

  new_v=$(cat ./pkgs/applications/misc/hubstaff/revision.json | jq -r .version)

  echo "$old_v -> $new_v"

  git add --all && git commit -m "hubstaff: $old_v -> $new_v"

  git push

  $HOME/.dotfiles/nixos/pkgs/hubstaff/update.sh
}
