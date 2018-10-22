{ pkgs, ... }:

{
  users = {
    mutableUsers = false;

    defaultUserShell = pkgs.zsh;

    extraUsers =
      let
        # generated via: mkpasswd -m sha-512
        hashedPassword = "$6$.afts/PK1fV$KsiZjqj188SfERHNsnz1mQWKeWOuB6dvjZIof8uomNqYOFQDj0uf9oGB6Kq5dGmZj3APIr7kvSss09IM1AoYW.";
      in {
        root = {
          inherit hashedPassword;
        };

        srghma = {
          isNormalUser = true;
          extraGroups = [ "audio" "disk" "wheel" "networkmanager" "docker" "vboxusers" "libvirtd" ];
          inherit hashedPassword;
        };
      };
  };
}
