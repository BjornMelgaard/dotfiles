# dotfiles
features: i3, neovim

![Imgur](https://i.imgur.com/szHs0NB.jpg)

# how to install on new computer

```sh
export MYUSERNAME=srghma

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
mkfs.vfat /dev/sdb1
mkswap -L swap /dev/sdb2
mkfs.ext4 -L nixos /dev/sdb3

# zfs info:
# https://apple.stackexchange.com/questions/111177/how-to-format-external-drive-into-zfs
# https://github.com/zfsonlinux/zfs/wiki/Ubuntu-18.04-Root-on-ZFS
# https://nixos.wiki/wiki/NixOS_on_ZFS (bottom)

zpool create -o ashift=12 -R /mnt rpool -f /dev/sdb3
zfs create -o mountpoint=legacy rpool/nixos
zfs create -o mountpoint=legacy rpool/home
zfs set compression=lz4 rpool/home
zfs set reservation=1G rpool

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
mkdir -p /mnt/home/$MYUSERNAME/.config
git clone --recursive https://github.com/srghma/dotfiles /mnt/home/$MYMYUSERNAME/.dotfiles

# BACKUP AUTOGENERATED CONFIGURATIONS
mv /mnt/etc/nixos/configuration.nix /mnt/etc/nixos/configuration.nix.old
mv /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hardware-configuration.nix.old

# COPY hardware-configuration.nix to dotfiles to be able to modify it without sudo
cp /mnt/etc/nixos/hardware-configuration.nix.old /mnt/home/$MYUSERNAME/.dotfiles/nixos/root/hardware-configuration.nix

# LINK CONFIGS TO CONFIGS IN DOTFILES

# this configuration is used only during installation
printf "import /mnt/home/$MYUSERNAME/.dotfiles/nixos/root/default.nix" > /mnt/etc/nixos/configuration.nix

# MODIFY HARDWARE CONFIGURATION IF YOU WANT
code --user-data-dir=/tmp/code /mnt/home/$MYUSERNAME/.dotfiles /mnt/etc/nixos/

# validate
nixos-rebuild dry-build -I nixos-config=/mnt/etc/nixos/configuration.nix

# INSTALL
nixos-install

# this configuration system will use after reboot
printf "import /home/$MYUSERNAME/.dotfiles/nixos/root/default.nix" > /mnt/etc/nixos/configuration.nix

# reboot
# execute each file in INSTALL directory
```
