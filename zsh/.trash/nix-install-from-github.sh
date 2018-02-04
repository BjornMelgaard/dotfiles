clone-and-cd () {
  cd $1
  git clone $2
  cd $(ls -tU | head -n 1)
}

nix-install-from-github () {
  olddir=`pwd`
  clone-and-cd /tmp $1
  nix-env -f . -i
  cd $olddir
}
