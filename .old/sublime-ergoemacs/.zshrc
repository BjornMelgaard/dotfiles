# oh-my-zsh
ZSH=/usr/share/oh-my-zsh/
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

bindkey "^[i" history-substring-search-up
bindkey "^[k" history-substring-search-down
bindkey "^[l" forward-char
bindkey "^[j" backward-char

bindkey "^[u" backward-word
bindkey "^[o" forward-word

bindkey "^[a" backward-delete-char
bindkey "^[s" delete-char

bindkey "^[q" backward-kill-word
bindkey "^[w" kill-word

alias st="subl3"
alias stt="subl3 -n ."

alias llserver="/home/bjorn/Documents/LINGUALEO/lingualeo-extension-interceptor/llserver.py -f /home/bjorn/anki.csv"
alias makesubtitles="/home/bjorn/Documents/LINGUALEO/lingualeo-extension-interceptor/makesubtitles.py"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-angular-cli="npm uninstall -g angular-cli && npm cache clean && npm install -g angular-cli@latest"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"
