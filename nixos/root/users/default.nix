{ pkgs, ... }:

{
  users = {
    mutableUsers = false;

    defaultUserShell = pkgs.zsh;

    extraUsers =
      let
        # generated via: mkpasswd -m sha-512
        hashedPassword = "$6$boVpiwO79WKlR2$Egc0DLU76n/mRuRgmFxHjnwCWUnajsY7snqe.OZ2awOUd0ymOpAf3OiSRmsOTxo0fLsQcKFRa8DdMQWcbu/8x1";
      in {
        root = {
          inherit hashedPassword;
        };

        srghma = {
          isNormalUser = true;
          extraGroups = [ "audio" "video" "disk" "wheel" "networkmanager" "docker" "vboxusers" "libvirtd" ];
          inherit hashedPassword;
        };
      };
  };
}
