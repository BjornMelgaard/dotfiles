# oh-my-zsh
DOTFILES=$HOME/.config/dotfiles
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
DISABLE_UPDATE_PROMPT=true
HISTSIZE=1000
SAVEHIST=1000

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
  # stack

  ## docker
  docker
  docker-compose

  ## js
  # yarn
)

source $ZSH/oh-my-zsh.sh
source $HOME/projects/zsh-nordicres/index.sh

for file in $DOTFILES/zsh/*.sh; do
  source $file
done

autoload -U zmv

PROJECT_PATHS=(~/projects)

# npm/yarn
export PATH="$HOME/.node_modules/bin:$PATH"

# gem
GEM_HOME=$HOME/.gem/ruby/2.4.0 # NOTE: same as `GEM_HOME=$(ruby -e 'puts Gem.user_dir')`, but loads faster
GEM_PATH=$GEM_HOME
export PATH=$GEM_HOME/bin:$PATH

export PATH="$PATH:$DOTFILES/scripts"
