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
alias r="SHELL=/home/bjorn/.bin/rshell ranger"

# Tmux ├────────────────────────────────────────────────────────────────────
alias tkda="tmux ls | grep -v attached | awk '{print substr(\$1, 0, length(\$1)-1)}' | xargs -n1 tmux kill-session -t"

alias mux="tmuxinator"
alias mux-new="tmuxinator new ${PWD##*/}"

alias tl="tmuxp load"

# Misc ├────────────────────────────────────────────────────────────────────
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && yarn global upgrade"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"

# Haskell ├────────────────────────────────────────────────────────────────────
# using https://wiki.archlinux.org/index.php/ArchHaskell and stack as package manager
alias haskell-install="sudo pacman -S haskell-stack-tool && stack install stylish-haskell ghc-mod hspec"

# Stack aliases
alias st="stack"
alias stb="stack build"
alias ghci="stack ghci"

# Ruby ├────────────────────────────────────────────────────────────────────

# sqlite
# alias rails-recreate-db="rails db:migrate VERSION=0 && rails db:drop && rails db:migrate"

# postgre
alias rails-recreate-db="rails db:drop && rails db:create && rails db:migrate"

alias rvm-new-project="rvm use --create --ruby-version"
alias gem-install-defaults="gem install bundler neovim rubocop"

# Git ├────────────────────────────────────────────────────────────────────
alias gpa="git push --all"

# JS ├────────────────────────────────────────────────────────────────────
alias y="yarn"
alias yr="yarn run"
alias yrd="yarn run dev"
alias yrdd="yarn run dev:debug"
alias yrl="yarn run lint"
alias yrlf="yarn run lint:fix"
alias ya="yarn add"
alias yad="yarn add -D"
alias yga="yarn global add"
alias yu="yarn upgrade"
alias yua="yarn-upgrade-all"
alias ygu="yarn global upgrade"

# Work ├────────────────────────────────────────────────────────────────────
alias greenbadger-test-and-dev="(ng serve --environment=test --port 5000 2>/dev/null; echo test client finished) & (ng serve 2>/dev/null; echo dev client finished) &"
