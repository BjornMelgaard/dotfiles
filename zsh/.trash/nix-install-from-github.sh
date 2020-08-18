git-clone-and-cd () {
  cd $1
  git clone $2
  cd $1/$(basename "$2")
}

nix-install-from-github () {
  olddir=`pwd`
  git-clone-and-cd /tmp $1
  nix-env -f . -i
  cd $olddir
}
