alias nif="nix-find"
alias nis="nix-shell"
alias nii="nix-env -i"
alias nir="nix-env -e"
alias niu="nix-env -u '*'"

# https://github.com/nixos-users/wiki/wiki/Garbage-collection
# https://github.com/NixOS/nixpkgs/blob/fb50cde71e3ffd149faca1a1762c245542a24875/nixos/modules/virtualisation/rkt.nix#L53
nix-purge () {
  sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old

  nix-collect-garbage -d
  sudo nix-collect-garbage -d
}
