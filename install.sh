DOTFILES_DIR=$(dirname `readlink -f $0`) # full path

ln -sf $DOTFILES_DIR/i3                  $HOME/.i3
ln -sf $DOTFILES_DIR/oh-my-zsh           $HOME/.oh-my-zsh
ln -sf $DOTFILES_DIR/nvim                $HOME/.config/nvim
ln -sf $DOTFILES_DIR/User                $HOME/.config/sublime-text-3/Packages/User

ln -sf $DOTFILES_DIR/gitconfig           $HOME/.gitconfig
ln -sf $DOTFILES_DIR/gitignore_global    $HOME/.gitignore_global

ln -sf $DOTFILES_DIR/gtkrc-2.0           $HOME/.gtkrc-2.0
ln -sf $DOTFILES_DIR/gtk-3.0-settings.ini $HOME/.config/gtk-3.0/settings.ini

ln -sf $DOTFILES_DIR/zshrc               $HOME/.zshrc
ln -sf $DOTFILES_DIR/zshenv              $HOME/.zshenv
ln -sf $DOTFILES_DIR/xinitrc             $HOME/.xinitrc
ln -sf $DOTFILES_DIR/yaourtrc            $HOME/.yaourtrc
ln -sf $DOTFILES_DIR/xkb                 $HOME/.config/xkb
