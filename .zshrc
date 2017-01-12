# oh-my-zsh
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

plugins=(
  vi-mode
  history-substring-search
  common-aliases
  dircycle dirpersist # enables cycling through the directory stack using Ctrl+Shift+Left/Right
  colorize
  compleat
  command-not-found
  pj

  # miscellaneous
  bundler ruby rails gem rvm
  systemd sudo git archlinux

  # custom plugins
  rake-fast
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit # for zsh-completions

# user settings
alias pjdot="cd $HOME/.config/dotfiles"
alias pjodot="$EDITOR $HOME/.config/dotfiles"

autoload -U zmv

bindkey -M viins '^[[3~'   delete-char # delete
bindkey -M viins '^[[3;5~' kill-word   # ctrl+delete
bindkey -M vicmd '^[[3~'   delete-char # delete
bindkey -M vicmd '^[[3;5~' kill-word   # ctrl+delete

bindkey -M viins '^[f' vi-forward-char  # alt+f
bindkey -M viins '^[b' vi-backward-char # alt+b

bindkey -M viins '^[[A' up-line-or-history   # up
bindkey -M viins '^[[B' down-line-or-history # down

bindkey -M viins '^P'  history-substring-search-up   # ctrl+p
bindkey -M viins '^N'  history-substring-search-down # ctrl+n

# quoted text objects
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
	for c in {a,i}{\',\",\`}; do
		bindkey -M $m $c select-quoted
	done
done

alias st="subl3"
alias stt="subl3 -n ."
alias vim="nvim-qt"

alias llserver="/home/bjorn/projects/lingualeo2anki/start_server.sh -f /home/bjorn/anki.txt"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-angular-cli="npm uninstall -g angular-cli && npm cache clean && npm install -g angular-cli@latest"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"
