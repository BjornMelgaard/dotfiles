{ pkgs }:

with pkgs;

rec {
  mutableUsers = false;

  defaultUserShell = zsh;

  extraUsers =
    let
      # generated via: mkpasswd -m sha-512
      hashedPassword = "$6$o07hw0C4z5G556G$UFlhI76sqijR71B/0Zz61FMEJMzfVi9KKgIzdWt1BTQdHw9L1aNVb6i37hz.TNL9gN1/gy4bHfzOjUROGcpKB/";
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
}
