DOTFILES_DIR=$(dirname `readlink -f $0`) # full path

ln -sfT $DOTFILES_DIR/i3                   $HOME/.i3
ln -sfT $DOTFILES_DIR/oh-my-zsh            $HOME/.oh-my-zsh
ln -sfT $DOTFILES_DIR/nvim                 $HOME/.config/nvim
ln -sfT $DOTFILES_DIR/ranger               $HOME/.config/ranger
ln -sfT $DOTFILES_DIR/User                 $HOME/.config/sublime-text-3/Packages/User

ln -sfT $DOTFILES_DIR/gitconfig            $HOME/.gitconfig
ln -sfT $DOTFILES_DIR/gitignore_global     $HOME/.gitignore_global

ln -sfT $DOTFILES_DIR/gtkrc-2.0            $HOME/.gtkrc-2.0
ln -sfT $DOTFILES_DIR/gtk-3.0-settings.ini $HOME/.config/gtk-3.0/settings.ini

ln -sfT $DOTFILES_DIR/zshrc                $HOME/.zshrc
ln -sfT $DOTFILES_DIR/zshenv               $HOME/.zshenv
ln -sfT $DOTFILES_DIR/xinitrc              $HOME/.xinitrc
ln -sfT $DOTFILES_DIR/yaourtrc             $HOME/.yaourtrc
ln -sfT $DOTFILES_DIR/xkb                  $HOME/.config/xkb
ln -sfT $DOTFILES_DIR/Xresources           $HOME/.Xresources
