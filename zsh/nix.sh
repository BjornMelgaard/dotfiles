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

# nix-show () {
#   nix-instantiate --eval -E "with import <nixpkgs> {}; lib.attrNames haskell.compiler"
# }

nix-my-prefetch-github () {
  repo_url=$1

  owner=`echo $repo_url | sed -Ene's#https://github.com/([^/]*)/(.*)(.git)?#\1#p'`
  if [ -z "$owner" ]; then
    echo "-- ERROR:  Could not identify owner."
    exit
  fi

  repo=`echo $repo_url | sed -Ene's#https://github.com/([^/]*)/(.*)(.git)?#\2#p'`
  if [ -z "$repo" ]; then
    echo "-- ERROR:  Could not identify Repo."
    exit
  fi

  resp=$(nix-prefetch-git $repo_url)

  rev=`echo $resp | grep 'rev' | sed -Ene's#.*\"rev\": \"([^\"]*)\",#\1#p'`
  sha256=`echo $resp | grep 'sha256' | sed -Ene's#.*\"sha256\": \"([^\"]*)\",#\1#p'`

  cat <<EOF


owner = "$owner";
repo = "$repo";
rev = "$rev";
sha256 = "$sha256";
EOF
}

alias nif="nix-find"
alias nis="nix-shell"
alias nii="nix-env -i"
alias nir="nix-env -e"

# Haskell
nix-install-haskell-package () {
  nix-env -f "<nixpkgs>" -iA haskellPackages.$1
}

nix-find-haskell-package () {
  nix-env -f "<nixpkgs>" -qaP -A haskellPackages $1
}

nix-ghci () {
  nix-shell --pure \
            -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [ mtl ])" \
            --run "ghci"
}
