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
