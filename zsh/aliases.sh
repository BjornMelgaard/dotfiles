# System ├────────────────────────────────────────────────────────────────────

alias netctl="sudo netctl"
alias pacman="sudo pacman"

alias pjdot="cd $HOME/.config/dotfiles"
alias pjodot="$EDITOR $HOME/.config/dotfiles"

alias vim="nvim"
alias vimdiff="nvim -d"
alias n="nvim"
alias k="kak"
alias r="SHELL=/home/bjorn/.bin/rshell ranger"

alias o="openssl"
alias d="docker"
alias top="htop"
alias sctl="systemctl"

alias tkda="tmux ls | grep -v attached | awk '{print substr(\$1, 0, length(\$1)-1)}' | xargs -n1 tmux kill-session -t"
alias wifi-spot="sudo create_ap wlp3s0 enp2s0 MyAccessPoint passphrase"
alias empty-hdd-trash="rm -fdR ~/Documents/.Trash-1000 ~/Downloads/.Trash-1000 ~/Music/.Trash-1000 ~/Pictures/.Trash-1000 ~/Videos/.Trash-1000"
alias update-all="yaourt --aur  -Syu --noconfirm && sudo gem update --system && gem update && npm cache clean && npm update -g"

alias greenbadger-test-and-dev="(ng serve --environment=test --port 5000 2>/dev/null; echo test client finished) & (ng serve 2>/dev/null; echo dev client finished) &"

alias wifi="sudo wifi-menu"
alias nstop="sudo netctl stop-all"

# Haskell ├────────────────────────────────────────────────────────────────────

# using https://wiki.archlinux.org/index.php/ArchHaskell and cabal as package manager
# alias haskell-reinstall="rm -rf ~/.cabal ~/.ghc && sudo pacman -S ghc cabal-install happy alex && cabal update && cabal install bimap stylish-haskell ghc-mod hspec"

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
alias gem-install-defaults="gem install bundler neovim rubocop typhoenus"
