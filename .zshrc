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

bindkey -M viins 'kj'    vi-cmd-mode
bindkey -M viins 'jk'    vi-cmd-mode
bindkey -M viins '^[l'   vi-forward-char             # alt+l
bindkey -M viins '^[h'   vi-backward-char            # alt+h
bindkey -M viins '^[i'   up-line-or-history          # alt+i
bindkey -M viins '^[k'   down-line-or-history        # alt+k
bindkey -M viins '^P'    history-substring-search-up # ctrl+p
bindkey -M viins '^N'    history-substring-search-up # ctrl+n
bindkey -M viins '^?'    backward-delete-char        # backspase
bindkey -M viins '^[[3~' delete-char                 # delete

bindkey -M vicmd 'k'     history-substring-search-up
bindkey -M vicmd 'j'     history-substring-search-up
bindkey -M vicmd '^?'    backward-delete-char        # backspase
bindkey -M vicmd '^[[3~' delete-char                 # delete

# bindkey -M vicmd "^D" list-choices
# bindkey -M vicmd "^G" list-expand
# bindkey -M vicmd "^H" vi-backward-char
# bindkey -M vicmd "^J" accept-line
# bindkey -M vicmd "^L" clear-screen
# bindkey -M vicmd "^M" accept-line
# bindkey -M vicmd "^N" down-history
# bindkey -M vicmd "^P" up-history
# bindkey -M vicmd "^R" redo
# bindkey -M vicmd "^[" beep
# bindkey -M vicmd "^[OA" up-line-or-history
# bindkey -M vicmd "^[OB" down-line-or-history
# bindkey -M vicmd "^[OC" vi-forward-char
# bindkey -M vicmd "^[OD" vi-backward-char
# bindkey -M vicmd "^[[200~" bracketed-paste
# bindkey -M vicmd "^[[3~" delete-char
# bindkey -M vicmd "^[[A" up-line-or-history
# bindkey -M vicmd "^[[B" down-line-or-history
# bindkey -M vicmd "^[[C" vi-forward-char
# bindkey -M vicmd "^[[D" vi-backward-char
# bindkey -M vicmd " " vi-forward-char
# bindkey -M vicmd "\"" vi-set-buffer
# bindkey -M vicmd "#" pound-insert
# bindkey -M vicmd "\$" vi-end-of-line
# bindkey -M vicmd "%" vi-match-bracket
# bindkey -M vicmd "'" vi-goto-mark-line
# bindkey -M vicmd "+" vi-down-line-or-history
# bindkey -M vicmd "," vi-rev-repeat-find
# bindkey -M vicmd "-" vi-up-line-or-history
# bindkey -M vicmd "." vi-repeat-change
# bindkey -M vicmd "/" vi-history-search-backward
# bindkey -M vicmd "0" vi-digit-or-beginning-of-line
# bindkey -M vicmd "1"-"9" digit-argument
# bindkey -M vicmd ":" execute-named-cmd
# bindkey -M vicmd ";" vi-repeat-find
# bindkey -M vicmd "<" vi-unindent
# bindkey -M vicmd "=" list-choices
# bindkey -M vicmd ">" vi-indent
# bindkey -M vicmd "?" vi-history-search-forward
# bindkey -M vicmd "A" vi-add-eol
# bindkey -M vicmd "B" vi-backward-blank-word
# bindkey -M vicmd "C" vi-change-eol
# bindkey -M vicmd "D" vi-kill-eol
# bindkey -M vicmd "E" vi-forward-blank-word-end
# bindkey -M vicmd "F" vi-find-prev-char
# bindkey -M vicmd "G" vi-fetch-history
# bindkey -M vicmd "I" vi-insert-bol
# bindkey -M vicmd "J" vi-join
# bindkey -M vicmd "N" vi-rev-repeat-search
# bindkey -M vicmd "O" vi-open-line-above
# bindkey -M vicmd "P" vi-put-before
# bindkey -M vicmd "R" vi-replace
# bindkey -M vicmd "S" vi-change-whole-line
# bindkey -M vicmd "T" vi-find-prev-char-skip
# bindkey -M vicmd "V" visual-line-mode
# bindkey -M vicmd "W" vi-forward-blank-word
# bindkey -M vicmd "X" vi-backward-delete-char
# bindkey -M vicmd "Y" vi-yank-whole-line
# bindkey -M vicmd "\^" vi-first-non-blank
# bindkey -M vicmd "\`" vi-goto-mark
# bindkey -M vicmd "a" vi-add-next
# bindkey -M vicmd "b" vi-backward-word
# bindkey -M vicmd "c" vi-change
# bindkey -M vicmd "d" vi-delete
# bindkey -M vicmd "e" vi-forward-word-end
# bindkey -M vicmd "f" vi-find-next-char
# bindkey -M vicmd "gE" vi-backward-blank-word-end
# bindkey -M vicmd "ga" what-cursor-position
# bindkey -M vicmd "ge" vi-backward-word-end
# bindkey -M vicmd "gg" beginning-of-buffer-or-history
# bindkey -M vicmd "g~" vi-oper-swap-case
# bindkey -M vicmd "g~~" "g~g~"
# bindkey -M vicmd "h" vi-backward-char
# bindkey -M vicmd "i" vi-insert
# bindkey -M vicmd "j"-"k" history-substring-search-up
# bindkey -M vicmd "l" vi-forward-char
# bindkey -M vicmd "m" vi-set-mark
# bindkey -M vicmd "n" vi-repeat-search
# bindkey -M vicmd "o" vi-open-line-below
# bindkey -M vicmd "p" vi-put-after
# bindkey -M vicmd "r" vi-replace-chars
# bindkey -M vicmd "s" vi-substitute
# bindkey -M vicmd "t" vi-find-next-char-skip
# bindkey -M vicmd "u" undo
# bindkey -M vicmd "v" edit-command-line
# bindkey -M vicmd "w" vi-forward-word
# bindkey -M vicmd "x" vi-delete-char
# bindkey -M vicmd "y" vi-yank
# bindkey -M vicmd "|" vi-goto-column
# bindkey -M vicmd "~" vi-swap-case
# bindkey -M vicmd "^?" backward-delete-char


alias vim="nvim-qt"
alias vi="nvim-qt"
alias vimdiff="nvim-qt -d"

alias st="subl3"
alias stt="subl3 -n ."

alias llserver="/home/bjorn/Documents/LINGUALEO/lingualeo-extension-interceptor/llserver.py -f /home/bjorn/anki.csv"
alias makesubtitles="/home/bjorn/Documents/LINGUALEO/lingualeo-extension-interceptor/makesubtitles.py"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-angular-cli="npm uninstall -g angular-cli && npm cache clean && npm install -g angular-cli@latest"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"
