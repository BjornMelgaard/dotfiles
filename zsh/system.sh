alias vim="nvim"
alias vimdiff="nvim -d"
alias n="nvim"
alias k="kak"
alias r="ranger"
alias z="zsh"
alias top="htop"
alias o="openssl"
alias d="docker"

# usage ln-s whatfile wherefile
alias ln-s="ln -sfT"

alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias wifi="nmtui"
alias sctl="systemctl"

alias pjdot="cd $DOTFILES"
alias pjodot="cd $DOTFILES && $EDITOR"

alias nh="n-history"

alias rmf="rm -rfd"

alias wifi-up="nmcli con up id PsychoB1tches"
alias wifi-down="nmcli con down id PsychoB1tches"

alias gdw="cd ~/Downloads"
alias gdo="cd ~/Documents"

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

chmodf() {
  find $2 -type f -exec chmod $1 {} \;
}

chmodd() {
  find $2 -type d -exec chmod $1 {} \;
}

unroot-root-files() {
  # * doesn't include hidden files by default
  sudo chown --from=root:root -R `whoami`:users ./*
  # hidden files
  sudo chown --from=root:root -R `whoami`:users ./.[^.]*
}

encrypt-all () {
  printf "Enter passphrase: "
  read -s pass

  for file in "$@"
  do
    echo "${pass}" | gpg --batch --no-tty --yes --passphrase-fd 0 --symmetric "${file}"
  done
}

decrypt-all () {
  printf "Enter passphrase: "
  read -s pass

  echo "${pass}" | gpg --batch --no-tty --yes --passphrase-fd 0 --decrypt-files "$@"
}
