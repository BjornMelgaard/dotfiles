# export EDITOR='/usr/bin/nvim'
export EDITOR='/usr/bin/kak'
export PROJECT_PATHS=(~/projects)
export PATH="$HOME/.bin:$HOME/projects/umsf/bin:$PATH"

# nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# heroku
export PATH=/usr/local/heroku/bin:$PATH

# haskell
export PATH=~/.cabal/bin:$PATH

# gem # XXX dont use this, if you use rvm
# GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
# GEM_PATH=$GEM_HOME
# export PATH=$GEM_HOME/bin:$PATH
