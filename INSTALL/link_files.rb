#! /usr/bin/env ruby

require_relative './config'

inhome_indotfiles = [
  ['.zshrc',                                  'zshrc'],
  ['.tmux.conf',                              'tmux.conf'],
  ['.i3/config',                              'i3/config'],

  ['.config/ranger/commands.py',              'ranger/commands.py'],
  ['.config/ranger/history',                  'ranger/history'],
  ['.config/ranger/rc.conf',                  'ranger/rc.conf'],
  ['.config/ranger/scope.sh',                 'ranger/scope.sh'],

  ['.gtkrc-2.0',                              'themes/gtkrc-2.0'],
  ['.config/gtk-3.0/settings.ini',            'themes/gtk-3.0-settings.ini'],

  ['.stack/config.yaml',                      'stack-global.yaml'],
  ['.gitconfig',                              'gitconfig'],
  ['.gitignore_global',                       'gitignore_global'],
  ['.ctags',                                  'ctags'],
  ['.ncmpcpp/bindings',                       'ncmpcpp_bindings'],
  ['.config/termite',                         'termite'],
  ['.commitlintrc.yml',                       'commitlintrc.yml'],

  ['.local/share/applications/mimeapps.list', 'mimeapps.list'],
  ['.config/mimeapps.list',                   'mimeapps.list'],

  ['.config/Code/User/settings.json',         'Code/settings.json'],
  ['.config/Code/User/extensions.json',       'Code/extensions.json'],
  ['.config/Code/User/snippets',              'Code/snippets'],

  ['.Xresources',                             'Xresources'],
  ['.Xresources.d',                           'Xresources.d'],

  ['.config/nvim',  'nvim'],
  ['.cabal/config', 'cabal_config']
]

inhome_indotfiles.each do |(inhome, indotfiles)|
  inhome_     = File.join $home, inhome
  indotfiles_ = File.join $dotfiles, indotfiles
  `mkdir -p "$(dirname "#{inhome_}")"`
  `ln -sfT "#{indotfiles_}" "#{inhome_}"`
end
