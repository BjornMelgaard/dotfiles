# using https://wiki.archlinux.org/index.php/ArchHaskell and stack as package manager
alias haskell-install="sudo pacman -S haskell-stack-tool && stack install stylish-haskell ghc-mod hspec"

# Stack aliases
# alias st="stack"
# alias stb="stack build"
# alias ghci="stack ghci"

install-haskell-package () {
  nix-env -f "<nixpkgs>" -iA haskellPackages.$1
}

# https://hackage.haskell.org/package/steeloverseer
hspec-watch () {
  sos $1 -c "stack runhaskell $1"
}
