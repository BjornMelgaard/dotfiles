nix-find () {
  nix-env -qa ".*$1.*" | more
}

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

nix-install-haskell-package () {
  nix-env -f "<nixpkgs>" -iA haskellPackages.$1
}

nix-find-haskell-package () {
  nix-env -f "<nixpkgs>" -qaP -A haskellPackages $1
}


alias nif="nix-find"
alias nis="nix-shell"
alias nii="nix-env -i"
alias nid="nix-env -e"
