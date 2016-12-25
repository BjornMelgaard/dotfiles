# nodejs
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# angular-cli
source /home/bjorn/.oh-my-zsh/custom/plugins/angular-cli-autocomplete/angular-cli-autocomplete.plugin.zsh

# heroku
export PATH=/usr/local/heroku/bin:$PATH

# haskell
export PATH=~/.cabal/bin:$PATH

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# gem
GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$GEM_HOME/bin:$PATH
