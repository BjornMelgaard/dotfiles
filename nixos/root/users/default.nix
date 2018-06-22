{ pkgs }:

with pkgs;
with (import /etc/nixos/metaconfiguration.nix);

rec {
  mutableUsers = false;
  defaultUserShell = zsh;
  extraUsers =
    # generated via: mkpasswd -m sha-512
    let hashedPassword = "$6$Xne/w.j0RkrN$lRcThoZiNea2YBhfbeVJ2dgylt6Ov0IZbh1bf3flR6DYNpnv8YTTPJGwhk/8XPGNkgIrlKtXfvBowCZ7nbVt6/";
  in {
    root = {
      inherit hashedPassword;
    };
    ${userName} = {
      isNormalUser = true;
      extraGroups = [ "audio" "disk" "wheel" "networkmanager" "docker" "vboxusers" "libvirtd" ];
      inherit hashedPassword;
    };
  };
}
