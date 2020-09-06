nix-install-from-github () {
  olddir=`pwd`
  cd /tmp
  git clone $1
  cd /tmp/$1
  nix-env -f . -i
  cd $olddir
}
