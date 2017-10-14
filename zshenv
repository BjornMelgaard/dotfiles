# nvim editor config
export EDITOR='/usr/bin/nvim'

# kakoune editor config
# export EDITOR='/usr/bin/kak'
# export PAGER=$HOME/.bin/kakpager
# export MANPAGER=$HOME/.bin/kakmanpager

# project jump config
export PROJECT_PATHS=(~/projects)

# heroku
export PATH="$PATH:/usr/local/heroku/bin"

# haskell
# export PATH=~/.cabal/bin:$PATH     # cabal
export PATH="$PATH:$HOME/.local/bin" # stack

# user paths
export PATH="$PATH:$HOME/projects/umsf/bin"

# prepend ~/.bin to make ~/.bin/ghc-mod override ghc-mod from ~/.local/bin (stack dir)
export PATH="$PATH:$HOME/.bin"

# gem # XXX dont use this, if you use rvm
# GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
# GEM_PATH=$GEM_HOME
# export PATH=$GEM_HOME/bin:$PATH
