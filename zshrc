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
  systemd sudo git archlinux

  # custom plugins
  rake-fast
  zsh-autosuggestions
  zsh-completions
)

ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_AUTOCONNECT=false

source $ZSH/oh-my-zsh.sh

alias pjdot="cd $HOME/.config/dotfiles"
alias pjodot="$EDITOR $HOME/.config/dotfiles"

alias vim="nvim"
alias vimdiff="nvim -d"
alias n="nvim"
alias r="SHELL=/home/bjorn/.config/ranger/rshell ranger"
alias top="htop"
alias tka="tmux ls | awk '{print substr(\$1, 0, length(\$1)-1)}' | xargs -n1 tmux kill-session -t"

alias llserver="/home/bjorn/projects/lingualeo2anki/start_server.sh -f /home/bjorn/anki.txt"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-angular-cli="npm uninstall -g angular-cli && npm cache clean && npm install -g angular-cli@latest"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"

alias rvmnew="rvm use --create --ruby-version"

# sqlite
# alias rails-recreate-db="rails db:migrate VERSION=0 && rails db:drop && rails db:migrate"
# postgre
alias rails-recreate-db="rails db:drop && rails db:create && rails db:migrate"

alias reinstall-postgre="sudo systemctl stop postgresql && sudo pacman -Rcns postgresql && cd /var/lib/postgres/ && sudo rm -rfd data && sudo pacman -S postgresql && cd ~ && sudo su - postgres -c \"initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'\" && sudo systemctl start postgresql && sudo su - postgres -c 'createuser -d bookstore && createdb -O bookstore bookstore_development && createdb -O bookstore bookstore_test'"

autoload -U zmv

# better deletion
bindkey -M viins '^?'      backward-delete-char # backspase
bindkey -M viins '^H'      backward-kill-word   # ctrl+backspase
bindkey -M viins '^[[3~'   delete-char          # delete
bindkey -M viins '^[[3;5~' kill-word            # ctrl+delete

bindkey -M vicmd '^?'      backward-delete-char # backspase
bindkey -M vicmd '^H'      backward-kill-word   # ctrl+backspase
bindkey -M vicmd '^[[3~'   delete-char          # delete
bindkey -M vicmd '^[[3;5~' kill-word            # ctrl+delete

# movement
bindkey -M viins '^[l' vi-forward-char
bindkey -M viins '^[h' vi-backward-char
bindkey -M viins '^[k' up-line-or-history
bindkey -M viins '^[j' down-line-or-history

# history
bindkey -M viins '^[[A' up-line-or-history            # up
bindkey -M viins '^[[B' down-line-or-history          # down
bindkey -M viins '^P'   history-substring-search-up   # ctrl+p
bindkey -M viins '^N'   history-substring-search-down # ctrl+n

# push-line
bindkey -M viins '^Q' push-line-or-edit
bindkey -M vicmd '^Q' push-line-or-edit

bindkey -M viins '^H' backward-delete-char

# quoted text objects
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done
