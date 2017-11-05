nix-find () {
  nix-env -qa ".*$1.*" | more
}
