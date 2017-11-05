# For local plugins testing ├────────────────────────────────────────────────────────────────────
link-vim-plugin () {
  source="/home/bjorn/projects/psc-ide-vim"
  target="/home/bjorn/.config/dotfiles/nvim/bundle/repos/github.com/FrigoEU/psc-ide-vim"
  mv $target $target.old
  ln -sT $source $target
}

unlink-vim-plugin () {
  source="/home/bjorn/projects/psc-ide-vim"
  target="/home/bjorn/.config/dotfiles/nvim/bundle/repos/github.com/FrigoEU/psc-ide-vim"
  rm -f $target
  mv $target.old $target
}
