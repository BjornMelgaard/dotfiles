DOTFILES=$HOME/.dotfiles

source $HOME/projects/zsh-nordicres/index.sh

for file in $HOME/.dotfiles/zsh/*.sh; do
  source $file
done

PROJECT_PATHS=($HOME/projects)

export MAKEFLAGS='-j5'

export PATH=$PATH:./node_modules/.bin
