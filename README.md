# dotfiles

# how to install on new computer

```sh
gdisk
# make 3 partitions: efi (code - ef00, last sector - +2M), swap (code - 8200, last sector - +8G), nixos (code - default, last sector - default)
mkfs.ext4 -L nixos /dev/sdb3
mkswap -L swap /dev/sdb2
mkfs.vfat /dev/sdb1
swapon /dev/sdb2
mount /dev/disk/by-label/nixos /mnt
mkdir /mnt/boot
mount /dev/sdb2 /mnt/boot
mkswap -L swap /dev/sdb2
nixos-generate-config --root /mnt
echo '{ allowUnfree = true; }' > ~/.config/nixpkgs/config.nix
nix-env -i git vscode
git clone 
```
