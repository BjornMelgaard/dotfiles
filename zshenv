# nvim editor config
export EDITOR='/usr/bin/nvim'

# kakoune editor config
# export EDITOR='/usr/bin/kak'
# export PAGER=$HOME/.bin/kakpager
# export MANPAGER=$HOME/.bin/kakmanpager

# user paths
export PATH="$HOME/.bin:$HOME/projects/umsf/bin:$PATH"

# project jump config
export PROJECT_PATHS=(~/projects)

# heroku
export PATH=/usr/local/heroku/bin:$PATH

# haskell
# export PATH=~/.cabal/bin:$PATH     # cabal
export PATH="$HOME/.local/bin:$PATH" # stack

# gem # XXX dont use this, if you use rvm
# GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
# GEM_PATH=$GEM_HOME
# export PATH=$GEM_HOME/bin:$PATH
