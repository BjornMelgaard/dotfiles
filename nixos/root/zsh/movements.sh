# better deletion
bindkey -M viins '^?'      backward-delete-char # backspase
bindkey -M viins '^[[3~'   delete-char          # delete
bindkey -M viins '^[[3;5~' kill-word            # ctrl+delete

bindkey -M vicmd '^?'      backward-delete-char # backspase
bindkey -M vicmd '^[[3~'   delete-char          # delete
bindkey -M vicmd '^[[3;5~' kill-word            # ctrl+delete

# movement
bindkey -M viins '^[l' vi-forward-char      # alt+l
bindkey -M viins '^[h' vi-backward-char     # alt+h
bindkey -M viins '^[k' up-line-or-history   # alt+k
bindkey -M viins '^[j' down-line-or-history # alt+j
bindkey -M viins '^[u' backward-word        # alt+u
bindkey -M viins '^[o' forward-word         # alt+o

# history
bindkey -M viins '^[[A' up-line-or-history            # up
bindkey -M viins '^[[B' down-line-or-history          # down
bindkey -M viins '^P'   history-substring-search-up   # ctrl+p
bindkey -M viins '^N'   history-substring-search-down # ctrl+n

# push-line
bindkey -M viins '^Q' push-line-or-edit # ctrl+Q
bindkey -M vicmd '^Q' push-line-or-edit # ctrl+Q

# erase WORD backward
backward-kill-bigword() { local WORDCHARS='@:*?_-.[]~=&;!#$%^(){}<>/'; zle backward-kill-word; }
zle -N backward-kill-bigword
bindkey -M viins '^[w' backward-kill-bigword

# quoted text objects
autoload -U select-bracketed
autoload -U select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in visual viopp; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;-=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done
