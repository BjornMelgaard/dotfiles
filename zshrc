# oh-my-zsh
DOTFILES=$HOME/.config/dotfiles
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
ZSH_CUSTOM=$DOTFILES/oh-my-zsh/custom
DISABLE_UPDATE_PROMPT=true

plugins=(
  ## appearence
  colorize
  compleat
  common-aliases
  # zsh-autosuggestions
  # zsh-completions

  ## editing
  vi-mode

  ## navigation
  history-substring-search
  dircycle
  dirpersist
  pj
  zsh-navigation-tools

  ## programs
  # tmux
  git

  ## nixos
  systemd
  sudo

  ## ruby
  bundler
  ruby
  rails
  gem
  # rvm
  # rake-fast

  ## haskell
  stack

  ## docker
  docker
  docker-compose

  ## js
  yarn
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/docker-alias/zshrc
source $DOTFILES/zsh/index.sh

autoload -U zmv

PROJECT_PATHS=(~/projects ~/work)

# npm
# export PATH="$HOME/.node_modules/bin:$PATH"
# export npm_config_prefix=~/.node_modules

# yarn
# export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:$HOME/.yarn/bin"

# rvm
# export PATH="$PATH:$HOME/.rvm/bin"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# gem
# GEM_HOME=$(ruby -e 'puts Gem.user_dir')
GEM_HOME=$HOME/.gem/ruby/2.3.0
GEM_PATH=$GEM_HOME
export PATH=$GEM_HOME/bin:$PATH
