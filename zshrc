# oh-my-zsh
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
ZSH_USER=$HOME/.zsh
DISABLE_UPDATE_PROMPT=true

plugins=(
  tmux tmuxinator
  vi-mode
  history-substring-search
  common-aliases
  dircycle dirpersist
  colorize
  compleat
  command-not-found
  pj
  zsh-navigation-tools
  yarn
  elm

  # miscellaneous
  bundler ruby rails gem rvm
  stack
  docker docker-compose
  systemd sudo archlinux git

  # custom plugins
  rake-fast
  zsh-autosuggestions
  # zsh-completions
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/docker-alias/zshrc
source $ZSH_USER/index.sh
# source $HOME/.zshenv

# autoload -U compinit && compinit # for zsh-completions
autoload -U zmv

# npm
# export PATH="$HOME/.node_modules/bin:$PATH"
# export npm_config_prefix=~/.node_modules

# yarn
export PATH="$PATH:$(yarn global bin)"

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
