# ------------------------------------------------------------------------------
#          FILE:  ember.plugin.zsh
#   DESCRIPTION:  oh-my-zsh ember plugin file.
#        AUTHOR:  Will Meldon (wdmeldon@gmail.com)
#       VERSION:  0.0.1
# ------------------------------------------------------------------------------
# Based (heavily) on composer.plugin.zsh
#
# Ember basic command completion
_ember_get_command_list () {
  ember | sed "1,/Available commands/d" | awk '/^ember [a-z]+/ { print $2 }'
}

_ember () {
  local curcontext="$curcontext" state line
  typeset -A opt_args
  _arguments \
    '1: :->command'\
    '*: :->args'
  compadd addon build destroy generate help init install new serve test version release
}

compdef _ember ember

alias em='ember'