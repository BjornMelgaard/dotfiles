# oh-my-zsh
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="bjorn"
DISABLE_AUTO_UPDATE="true"
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then mkdir $ZSH_CACHE_DIR; fi
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

plugins=(
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
autoload -U compinit && compinit

# user settings
export EDITOR='nvim-qt'
export PROJECT_PATHS=(~/projects)

alias pjdot="cd $HOME/.config/dotfiles"
alias pjodot="$EDITOR $HOME/.config/dotfiles"

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
alias vim="nvim-qt"

alias llserver="/home/bjorn/projects/lingualeo2anki/start_server.sh -f /home/bjorn/anki.txt"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-angular-cli="npm uninstall -g angular-cli && npm cache clean && npm install -g angular-cli@latest"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"
