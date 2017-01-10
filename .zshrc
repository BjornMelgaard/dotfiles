# oh-my-zsh
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
plugins=(
  # core
  history-substring-search
  common-aliases
  dircycle dirpersist # enables cycling through the directory stack using Ctrl+Shift+Left/Right
  colorize
  compleat
  command-not-found
  zsh-autosuggestions
  pj
  # miscellaneous
  rake-fast bundler ruby rails gem rvm
  systemd sudo git archlinux
)
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
source $ZSH/oh-my-zsh.sh

# user settings
export EDITOR='subl3'
export PROJECT_PATHS=(~/projects ~/.config)

autoload -U zmv

bindkey "^[k" up-line-or-history
bindkey "^[j" down-line-or-history
bindkey "^[l" forward-char
bindkey "^[h" backward-char

bindkey "^[u" backward-word
bindkey "^[o" forward-word

bindkey "^[a" backward-delete-char
bindkey "^[s" delete-char

bindkey "^[q" backward-kill-word
bindkey "^[w" kill-word

bindkey "^[z" undo
bindkey "^[Z" redo

alias st="subl3"
alias stt="subl3 -n ."
alias vim="nvim"

alias -g :L='| less'
alias -g :H='| head'
alias -g :T='| tail'
alias -g :G='| grep'
alias -g :LL="2>&1 | less"
alias -g :NE="2>/dev/null"
alias -g :NO="1>/dev/null"
alias -g :NUL='&>/dev/null'

alias llserver="/home/bjorn/projects/lingualeo2anki/start_server.sh -f /home/bjorn/anki.txt"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-angular-cli="npm uninstall -g angular-cli && npm cache clean && npm install -g angular-cli@latest"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"
