# oh-my-zsh
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

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

  # miscellaneous
  bundler ruby rails gem rvm
  docker docker-compose
  systemd sudo git archlinux

  # custom plugins
  rake-fast
  zsh-autosuggestions
  # zsh-completions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/custom/plugins/docker-alias/zshrc

# autoload -U compinit && compinit # zsh-completions
autoload -U zmv

# nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# rvm
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# [[ -n "$ZSH_TMUX_AUTOSTART" ]] || ZSH_TMUX_AUTOSTART=true
# [[ -n "$ZSH_TMUX_AUTOCONNECT" ]] || ZSH_TMUX_AUTOCONNECT=false

# aliases
alias pjdot="cd $HOME/.config/dotfiles"
alias pjodot="$EDITOR $HOME/.config/dotfiles"

alias vim="nvim"
alias vimdiff="nvim -d"
alias n="nvim"
alias r="SHELL=/home/bjorn/.bin/rshell ranger"
alias o="openssl"
alias k="kak"
alias d="docker"
alias top="htop"
alias sctl="systemctl"
alias tkda="tmux ls | grep -v attached | awk '{print substr(\$1, 0, length(\$1)-1)}' | xargs -n1 tmux kill-session -t"

alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"
alias greenbadger-test-and-dev="(ng serve --environment=test --port 5000 2>/dev/null; echo test client finished) & (ng serve 2>/dev/null; echo dev client finished) &"

alias wifi="sudo wifi-menu"
alias nstop="sudo netctl stop-all"

alias rvm-new-project="rvm use --create --ruby-version"

# sqlite
# alias rails-recreate-db="rails db:migrate VERSION=0 && rails db:drop && rails db:migrate"
# postgre
alias rails-recreate-db="rails db:drop && rails db:create && rails db:migrate"

# postgresql helpers
postgresql-reinstall () {
  sudo systemctl stop postgresql
  sudo pacman -Rcns --noconfirm postgresql
  sudo rm -rfd /var/lib/postgres/data
  sudo pacman -S --noconfirm postgresql
  sudo su - postgres -c "initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'"
  sudo systemctl start postgresql
}

postgresql-new-project () {
  sudo su - postgres -c "createuser -d $1 "\
    "&& createdb -O $1 $1_development "\
    "&& createdb -O $1 $1_test"
}

# better deletion
bindkey -M viins '^?'      backward-delete-char # backspase
bindkey -M viins '^[[3~'   delete-char          # delete
bindkey -M viins '^[[3;5~' kill-word            # ctrl+delete

bindkey -M vicmd '^?'      backward-delete-char # backspase
bindkey -M vicmd '^[[3~'   delete-char          # delete
bindkey -M vicmd '^[[3;5~' kill-word            # ctrl+delete

# movement
bindkey -M viins '^[l' vi-forward-char
bindkey -M viins '^[h' vi-backward-char
bindkey -M viins '^[k' up-line-or-history
bindkey -M viins '^[j' down-line-or-history
bindkey -M viins '^[u' backward-word
bindkey -M viins '^[o' forward-word

# history
bindkey -M viins '^[[A' up-line-or-history            # up
bindkey -M viins '^[[B' down-line-or-history          # down
bindkey -M viins '^P'   history-substring-search-up   # ctrl+p
bindkey -M viins '^N'   history-substring-search-down # ctrl+n

# push-line
bindkey -M viins '^Q' push-line-or-edit
bindkey -M vicmd '^Q' push-line-or-edit

# erase WORD backward
backward-kill-bigword() { local WORDCHARS='@:*?_-.[]~=&;!#$%^(){}<>/'; zle backward-kill-word; }
zle -N backward-kill-bigword
bindkey -M viins '^[w' backward-kill-bigword

# quoted text objects
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done
