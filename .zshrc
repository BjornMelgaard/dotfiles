# oh-my-zsh
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
plugins=(
  # core
  vi-mode
  history-substring-search
  common-aliases
  dircycle dirpersist # enables cycling through the directory stack using Ctrl+Shift+Left/Right
  colorize
  compleat
  command-not-found
  zsh-256color
  zsh-autosuggestions
  # miscellaneous
  rake-fast bundler ruby rails gem rvm
  systemd sudo git archlinux
)
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
source $ZSH/oh-my-zsh.sh

# user settings
autoload -U zmv

# common
bindkey -M viins '^?'      backward-delete-char          # backspase
bindkey -M viins '^H'      backward-kill-word            # ctrl+backspase
bindkey -M viins '^[[3~'   delete-char                   # delete
bindkey -M viins '^[[3;5~' kill-word                     # ctrl+delete

bindkey -M vicmd '^?'      backward-delete-char          # backspase
bindkey -M vicmd '^H'      backward-kill-word            # ctrl+backspase
bindkey -M vicmd '^[[3~'   delete-char                   # delete
bindkey -M vicmd '^[[3;5~' kill-word                     # ctrl+delete

# insert mode
bindkey -M viins '^[l' vi-forward-char               # alt+l
bindkey -M viins '^[h' vi-backward-char              # alt+h
bindkey -M viins '^[i' up-line-or-history            # alt+i
bindkey -M viins '^[k' down-line-or-history          # alt+k

bindkey -M viins 'kj'  vi-cmd-mode
bindkey -M viins 'jk'  vi-cmd-mode
bindkey -M viins '^;'  vi-cmd-mode

bindkey -M viins '^P'  history-substring-search-up   # ctrl+p
bindkey -M viins '^N'  history-substring-search-down # ctrl+n

# command mode
bindkey -M vicmd 'i' history-substring-search-up
bindkey -M vicmd 'k' history-substring-search-down
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "l" vi-forward-char

bindkey -M vicmd "z" undo
bindkey -M vicmd "Z" redo

bindkey -M vicmd "u"   vi-backward-word
bindkey -M vicmd "o"   vi-forward-word
bindkey -M vicmd "^U"  vi-backward-word-end
bindkey -M vicmd "^O"  vi-forward-word-end

bindkey -M vicmd "h" vi-digit-or-beginning-of-line
bindkey -M vicmd "p" vi-end-of-line

bindkey -M vicmd "d" vi-add-next
bindkey -M vicmd "f" vi-insert

bindkey -M vicmd "s" vi-delete
bindkey -M vicmd "S" vi-kill-eol

bindkey -M vicmd "r" vi-change

alias st="subl3"
alias stt="subl3 -n ."

alias llserver="/home/bjorn/Documents/LINGUALEO/lingualeo-extension-interceptor/llserver.py -f /home/bjorn/anki.csv"
alias makesubtitles="/home/bjorn/Documents/LINGUALEO/lingualeo-extension-interceptor/makesubtitles.py"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-angular-cli="npm uninstall -g angular-cli && npm cache clean && npm install -g angular-cli@latest"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"
