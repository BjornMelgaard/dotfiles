# Archlinux ├────────────────────────────────────────────────────────────────────
alias netctl="sudo netctl"
alias pacman="sudo pacman"
alias wifi="sudo wifi-menu"
alias nstop="sudo netctl stop-all"
alias sctl="systemctl"

alias top="htop"
alias o="openssl"
alias d="docker"

alias pjdot="cd $HOME/.config/dotfiles"
alias pjodot="$EDITOR $HOME/.config/dotfiles"

# Editors ├────────────────────────────────────────────────────────────────────
alias vim="nvim"
alias vimdiff="nvim -d"
alias n="nvim"
alias k="kak"
alias r="ranger"
alias rs="SHELL=/home/bjorn/.bin/rshell ranger"
alias z="zsh"

# Tmux ├────────────────────────────────────────────────────────────────────
alias tkda="tmux ls | grep -v attached | awk '{print substr(\$1, 0, length(\$1)-1)}' | xargs -n1 tmux kill-session -t"

alias mux="tmuxinator"
alias mux-new="tmuxinator new ${PWD##*/}"

alias tl="tmuxp load"

# Misc ├────────────────────────────────────────────────────────────────────
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && yarn global upgrade"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"

tmuxp-new () {
  arg_or_dev=${1:-dev}
  fullname="tmuxp.$arg_or_dev.yaml"
  touch $fullname
  cat <<EOF > $fullname
session_name: $arg_or_dev
start_directory: ./ # session file directory
windows:
- window_name: dev window
  layout: tiled
  panes:
    - shell_command:           # pane no. 1
        - cd /var/log          # run multiple commands in this pane
        - ls -al | grep \.log
    - echo second pane         # pane no. 2
    - echo third pane          # pane no. 3
    - echo forth pane          # pane no. 4
EOF
  nvim $fullname
}
