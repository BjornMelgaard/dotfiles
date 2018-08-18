alias nf="nix-find"
alias ns="nix-shell"
alias nii="nix-env -i"
alias nir="nix-env -e"
alias niu="nix-env -u '*'"

# https://github.com/nixos-users/wiki/wiki/Garbage-collection
# https://github.com/NixOS/nixpkgs/blob/fb50cde71e3ffd149faca1a1762c245542a24875/nixos/modules/virtualisation/rkt.nix#L53
nix-purge () {
  # make all results of nix-build collected in next gc run
  # rm /nix/var/nix/gcroots/auto/*

  sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old

  nix-collect-garbage -d
  sudo nix-collect-garbage -d
}

install-latest-docker-compose () {
  sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixos-unstable
  sudo nix-channel --update
  nix-env -f "<nixos-unstable>" -i docker-compose
}

nix-format () {
  cat "$1" | nix-beautify | tee "$1"
}
