DOTFILES_DIR=$(dirname `readlink -f $0`) # full path

ln -s $DOTFILES_DIR/.i3                  $HOME/.i3
ln -s $DOTFILES_DIR/.oh-my-zsh           $HOME/
ln -s $DOTFILES_DIR/nvim                 $HOME/.config/nvim
ln -s $DOTFILES_DIR/User                 $HOME/.config/sublime-text-3/Packages/User

ln -s $DOTFILES_DIR/.gitconfig           $HOME/
ln -s $DOTFILES_DIR/.gitignore_global    $HOME/

ln -s $DOTFILES_DIR/.gtkrc-2.0           $HOME/
ln -s $DOTFILES_DIR/gtk-3.0-settings.ini $HOME/gtk-3.0/settings.ini

ln -s $DOTFILES_DIR/.zshrc               $HOME/
ln -s $DOTFILES_DIR/.zshenv              $HOME/
ln -s $DOTFILES_DIR/.xinitrc             $HOME/
ln -s $DOTFILES_DIR/.yaourtrc            $HOME/
ln -s $DOTFILES_DIR/xkb                  $HOME/.config/
