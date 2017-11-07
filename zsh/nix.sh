nix-find () {
  nix-env -qa ".*$1.*" | more
}

# install from file
# nix-env -f ./default.nix -i 'home-manager' -v -r
