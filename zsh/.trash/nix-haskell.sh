# Stack aliases
alias st="stack"
alias stb="stack build"
alias ghci="stack ghci"

install-haskell-package () {
  nix-env -f "<nixpkgs>" -iA haskellPackages.$1
}

# https://hackage.haskell.org/package/steeloverseer
hspec-watch () {
  sos $1 -c "stack runhaskell $1"
}

nix-install-haskell-package () {
  nix-env -f "<nixpkgs>" -iA haskellPackages.$1
}

nix-find-haskell-package () {
  nix-env -f "<nixpkgs>" -qaP -A haskellPackages $1
}

nix-ghci () {
  nix-shell --pure \
            -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [ adjunctions ])" \
            --run "ghci"
}
