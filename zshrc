# oh-my-zsh
DOTFILES=$HOME/.config/dotfiles
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
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
  # NOTE: nix-zsh-completions already installed via `programs.zsh.enableCompletion = true`
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
source $DOTFILES/zsh/index.sh
source ~/projects/zsh-nordicres/index.sh

autoload -U zmv

PROJECT_PATHS=(~/projects)

# npm/yarn
export PATH="$HOME/.node_modules/bin:$PATH"

# helper
# npm install -g yarn javascript-typescript-langserver linted-git-commit @commitlint/{config-conventional,cli}

# gem
# GEM_HOME=$(ruby -e 'puts Gem.user_dir')
# or
GEM_HOME=$HOME/.gem/ruby/2.4.0
GEM_PATH=$GEM_HOME
export PATH=$GEM_HOME/bin:$PATH

export PATH="$PATH:$DOTFILES/scripts"
