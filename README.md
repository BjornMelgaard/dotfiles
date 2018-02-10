# dotfiles
features: i3, neovim

# how to install on new computer

```sh
export MYUSERNAME=yourusername

# INSTALL SOFTWARE
mkdir -p ~/.config/nixpkgs
echo '{ allowUnfree = true; }' > ~/.config/nixpkgs/config.nix
nix-env -i git vscode
code --user-data-dir=/tmp/code --install-extension bbenoist.Nix

# MAKE PARTITIONS
gdisk /dev/sdb
# make 3 partitions: efi (code - ef00, last sector - +100M), swap (code - 8200, last sector - +8G), nixos (code - default, last sector - default)
mkfs.vfat /dev/sdb1
mkswap -L swap /dev/sdb2
mkfs.ext4 -L nixos /dev/sdb3

# MOUNT
swapon /dev/sdb2
mount /dev/disk/by-label/nixos /mnt
mkdir /mnt/boot
mount /dev/sdb1 /mnt/boot

# GENERATE CONFIGURATION
nixos-generate-config --root /mnt

# CLONE DOTFILES
mkdir -p /mnt/home/$MYUSERNAME/.config
git clone --recursive https://github.com/BjornMelgaard/dotfiles /mnt/home/$MYMYUSERNAME/.config/dotfiles

# BACKUP AUTOGENERATED CONFIGURATIONS
mv /mnt/etc/nixos/configuration.nix /mnt/etc/nixos/configuration.nix.old
mv /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hardware-configuration.nix.old

# COPY hardware-configuration.nix to dotfiles to be able to modify it without sudo
cp /mnt/etc/nixos/hardware-configuration.nix.old /mnt/home/$MYUSERNAME/.config/dotfiles/nixos/root/hardware-configuration.nix

# LINK CONFIGS TO CONFIGS IN DOTFILES
# this configuration is used only during installation, because dotfiles have `import /etc/nixos/metaconfiguration.nix` hardcoded
printf "rec {\n  userName=\"$MYUSERNAME\";\n  dotfilesDir=/mnt/home/$MYUSERNAME/.config/dotfiles;\n}" > /etc/nixos/metaconfiguration.nix

# this configuration system will use after reboot
printf "rec {\n  userName=\"$MYUSERNAME\";\n  dotfilesDir=/home/$MYUSERNAME/.config/dotfiles;\n}" > /mnt/etc/nixos/metaconfiguration.nix

# link /etc/nixos/configuration.nix to dotfiles
printf "with (import /etc/nixos/metaconfiguration.nix);\nimport \"\${dotfilesDir}/nixos/root/default.nix\"" > /mnt/etc/nixos/configuration.nix

# link /home/$MYUSERNAME/.config/nixpkgs/config.nix to dotfiles
mkdir -p /mnt/home/$MYUSERNAME/.config/nixpkgs
printf "with (import /etc/nixos/metaconfiguration.nix);\nimport \"\${dotfilesDir}/nixos/home/config.nix\"" > /mnt/home/$MYUSERNAME/.config/nixpkgs/config.nix

# MODIFY HARDWARE CONFIGURATION IF YOU WANT
code --user-data-dir=/tmp/code /mnt/home/$MYUSERNAME/.config/dotfiles /mnt/etc/nixos/

# INSTALL
nixos-install
# reboot
# execute each file in INSTALL directory
```
