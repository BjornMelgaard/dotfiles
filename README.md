# dotfiles
features: i3, neovim

![Imgur](https://i.imgur.com/szHs0NB.jpg)

# how to install on new computer

```sh
# to enable internet using networkmanager (because KDE gui is buggy)
nmtui

# OR to enable internet using wpa_supplicant
ip address show # to show <IFNAME>, e.g. wlp3s0
iwlist scanning # to show SSID of network you want to connect to
wpa_passphrase <MYSSID> <MYPASS> > /tmp/wifi.conf
wpa_supplicant -Dwext -i<IFNAME> -C/tmp/wifi.conf

# INSTALL SOFTWARE
mkdir -p ~/.config/nixpkgs
echo '{ allowUnfree = true; }' > ~/.config/nixpkgs/config.nix
nix-env -i git git-crypt vscode ranger google-chrome pcmanfm
code --user-data-dir=/tmp/code --install-extension bbenoist.Nix
export EDITOR=vim

# ENABLE ZFS
chmod +w /etc/nixos/configuration.nix
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

# create pool named mypool
zpool create -o ashift=12 -O compression=lz4 -O reservation=1G -O xattr=sa -f -R /mnt mypool /dev/sdb3 /dev/sda5 cache /dev/sdb4

# create datasets
zfs create -o mountpoint=legacy                                              mypool/root
zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=false               mypool/var_cache
zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=false -o acltype=posixacl -o xattr=sa              mypool/var_log
zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=false -o exec=on    mypool/var_tmp
zfs create -o mountpoint=legacy -o com.sun:auto-snapshot=false -o setuid=off mypool/tmp

# Useful zfs commands:
zpool import mypool # to import alredy created pool (searches all /dev/*)
zfs list # to list filesystems
zpool list # to list pools
zpool status # to show pool status
zdb # to show type of each disk in pool

# MOUNT
swapon /dev/sdb2
mount -t zfs mypool/root /mnt

mkdir -p /mnt/boot
mount /dev/sdb1 /mnt/boot

mkdir -p /mnt/var/cache
mount -t zfs mypool/var_cache /mnt/var/cache

mkdir -p /mnt/var/log
mount -t zfs mypool/var_log /mnt/var/log

mkdir -p /mnt/var/tmp
mount -t zfs mypool/var_tmp /mnt/var/tmp

mkdir -p /mnt/tmp
mount -t zfs mypool/tmp /mnt/tmp

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
mkdir -p /mnt/home/srghma/.config/nixpkgs/
printf "import /home/srghma/.dotfiles/nixos/home/config.nix" > /mnt/home/srghma/.config/nixpkgs/config.nix

# reboot
# execute each file in INSTALL directory
```
