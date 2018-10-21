# dotfiles
features: i3, neovim

![Imgur](https://i.imgur.com/szHs0NB.jpg)

# how to install on new computer

```sh
nmtui # to enable internet (KDE gui is buggy)

# INSTALL SOFTWARE
mkdir -p ~/.config/nixpkgs
echo '{ allowUnfree = true; }' > ~/.config/nixpkgs/config.nix
nix-env -i git git-crypt vscode ranger google-chrome pcmanfm
code --user-data-dir=/tmp/code --install-extension bbenoist.Nix

# ENABLE ZFS
vim /etc/nixos/configuration.nix
# add `boot.supportedFilesystems = [ "zfs" ];`
nixos-rebuild switch
modprobe zfs

# MAKE PARTITIONS
gdisk /dev/sdb
# make 3 partitions: efi (code - ef00, last sector - +100M), swap (code - 8200, last sector - +8G), nixos (code - default, last sector - default)
mkfs.vfat -n NIXOS_BOOT /dev/sdb1
mkswap -L NIXOS_SWAP /dev/sdb2

# zfs info:
# https://apple.stackexchange.com/questions/111177/how-to-format-external-drive-into-zfs
# https://github.com/zfsonlinux/zfs/wiki/Ubuntu-18.04-Root-on-ZFS
# https://nixos.wiki/wiki/NixOS_on_ZFS (bottom)
# https://unix.stackexchange.com/questions/304369/combining-ssd-hdd-into-single-fast-large-partition

zpool create -o ashift=12 -f -R /mnt rpool /dev/sdb3 # create pool named rpool with ssd partition (type - disk)
zpool add -f rpool /dev/sda5 # add hdd partition to pool (type - disk)
zfs create -o mountpoint=legacy rpool/nixos
zfs create -o mountpoint=legacy rpool/home
zfs set compression=lz4 rpool/home
zfs set reservation=1G rpool

# Useful zfs commands:
zpool import rpool # to import alredy created pool (searches all /dev/*)
zfs list # to list filesystems
zpool list # to list pools
zpool status # to show pool status
zdb # to show type of each disk in pool

# MOUNT
swapon /dev/sdb2
mount -t zfs rpool/nixos /mnt
mkdir /mnt/boot
mount /dev/sdb1 /mnt/boot
mkdir /mnt/home
mount -t zfs rpool/home /mnt/home

# GENERATE CONFIGURATION
nixos-generate-config --root /mnt

# CLONE DOTFILES
mkdir -p /mnt/home/srghma/.config
git clone --recursive https://github.com/srghma/dotfiles /mnt/home/srghma/.dotfiles

# BACKUP AUTOGENERATED CONFIGURATIONS
mv /mnt/etc/nixos/configuration.nix /mnt/etc/nixos/configuration.nix.old
mv /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hardware-configuration.nix.old

# COPY hardware-configuration.nix to dotfiles to be able to modify it without sudo
cp /mnt/etc/nixos/hardware-configuration.nix.old /mnt/home/srghma/.dotfiles/nixos/root/hardware-configuration.nix

# LINK CONFIGS TO CONFIGS IN DOTFILES

# this configuration is used only during installation
printf "import /mnt/home/srghma/.dotfiles/nixos/root/default.nix" > /mnt/etc/nixos/configuration.nix

# MODIFY HARDWARE CONFIGURATION IF YOU WANT
code --user-data-dir=/tmp/code /mnt/home/srghma/.dotfiles /mnt/etc/nixos

# INSTALL
nixos-install
# or validate (only if nixos-install throws errors)
nixos-rebuild dry-build -I nixos-config=/mnt/etc/nixos/configuration.nix
# or just rebuild configuration
nixos-install --no-bootloader --no-root-passwd --no-channel-copy
# or enter using chroot
nixos-enter

# this configuration system will use after reboot
printf "import /home/srghma/.dotfiles/nixos/root/default.nix" > /mnt/etc/nixos/configuration.nix

# reboot
# execute each file in INSTALL directory
```
