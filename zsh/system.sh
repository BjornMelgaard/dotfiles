alias vim="nvim"
alias vimdiff="nvim -d"
alias n="nvim"
alias k="kak"
alias r="ranger"
alias rs="SHELL=/home/bjorn/.bin/rshell ranger"
alias z="zsh"
alias top="htop"
alias o="openssl"
alias d="docker"

# usage ln-s whatfile wherefile
alias ln-s="ln -sfT"

alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias wifi="nmtui"
alias sctl="systemctl"

alias pjdot="cd $HOME/.config/dotfiles"
alias pjodot="cd $HOME/.config/dotfiles && $EDITOR"

alias nh="n-history"

alias rmf="rm -rfd"

cdlast () {
  cd $(ls -tU | head -n 1)
}

mkdcd () {
  mkdir $1
  cdlast
}

empty-hdd-trash () {
  hdd_dirs=(Documents Downloads Music Pictures Videos)
  for dir in $hdd_dirs
  do
    rm -fdR ~/$dir/.Trash-1000
  done
}

# update-all () {
#   yaourt --aur -Syu --noconfirm
#   sudo gem update --system
#   gem update
#   yarn global upgrade
# }
