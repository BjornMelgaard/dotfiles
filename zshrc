# oh-my-zsh
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
ZSH_USER=$HOME/.zsh

plugins=(
  tmux
  vi-mode
  history-substring-search
  common-aliases
  dircycle dirpersist
  colorize
  compleat
  command-not-found
  pj
  zsh-navigation-tools
  yarn elm

  # miscellaneous
  bundler ruby rails gem rvm
  stack
  docker docker-compose
  systemd sudo git archlinux

  # custom plugins
  rake-fast
  zsh-autosuggestions
  # zsh-completions
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/docker-alias/zshrc
source $ZSH_USER/index.sh

# autoload -U compinit && compinit # for zsh-completions
autoload -U zmv

# nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# [[ -n "$ZSH_TMUX_AUTOSTART" ]] || ZSH_TMUX_AUTOSTART=true
# [[ -n "$ZSH_TMUX_AUTOCONNECT" ]] || ZSH_TMUX_AUTOCONNECT=false

