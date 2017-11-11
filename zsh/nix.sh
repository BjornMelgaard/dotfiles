clone-to () {
  cd $1
  git clone $2
  cd $(ls -tU | head -n 1)
}

nix-install-from-github () {
  olddir=`pwd`
  clone-to /tmp $1
  nix-env -f . -i
  cd $olddir
}

alias nis="nix-shell"
alias nii="nix-env -i"
alias nid="nix-env -e"
