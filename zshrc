# oh-my-zsh
DOTFILES=$HOME/.dotfiles
DEFAULT_USER="srghma"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT=true

source $HOME/projects/zsh-nordicres/index.sh

for file in $DOTFILES/zsh/*.sh; do
  source $file
done

autoload -U zmv

PROJECT_PATHS=(~/projects)

# npm/yarn
export PATH="$HOME/.node_modules/bin:$PATH"

# gem
GEM_HOME=$HOME/.gem/ruby/2.4.0 # NOTE: same as `GEM_HOME=$(ruby -e 'puts Gem.user_dir')`, but loads faster
GEM_PATH=$GEM_HOME
export PATH=$GEM_HOME/bin:$PATH

export PATH="$PATH:$DOTFILES/scripts"
