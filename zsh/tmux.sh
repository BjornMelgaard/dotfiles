alias tkda="tmux ls | grep -v attached | awk '{print substr(\$1, 0, length(\$1)-1)}' | xargs -n1 tmux kill-session -t"

alias mux="tmuxinator"
alias mux-new="tmuxinator new ${PWD##*/}"

alias tl="tmuxp load"

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
