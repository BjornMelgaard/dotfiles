# !/usr/bin/env nix-shell
# !nix-shell -i ruby -p ruby

inhome_indotfiles = [
  ['.zshrc',                       'zshrc'],
  ['.tmux.conf',                   'tmux.conf'],
  ['.i3/config',                   'i3/config'],
  ['.config/nvim',                 'nvim'],
  ['.config/ranger/commands.py',   'ranger/commands.py'],
  ['.config/ranger/history',       'ranger/history'],
  ['.config/ranger/rc.conf',       'ranger/rc.conf'],
  ['.config/ranger/scope.sh',      'ranger/scope.sh'],
  ['.stack/config.yaml',           'stack-global.yaml'],
  ['.config/dunst/dunstrc',        'dunstrc'],
  ['.gitconfig',                   'gitconfig'],
  ['.gitignore_global',            'gitignore_global'],
  ['.gtkrc-2.0',                   'gtkrc-2.0'],
  ['.config/gtk-3.0/settings.ini', 'gtk-3.0-settings.ini'],
  ['.ctags',                       'ctags'],
  ['.ncmpcpp/bindings',            'ncmpcpp_bindings'],
  ['.config/termite',              'termite'],
  ['.commitlintrc.yml',            'commitlintrc.yml']
]

dotfiles = Dir.pwd
home = ENV['HOME']

inhome_indotfiles.each do |(inhome, indotfiles)|
  inhome_     = File.join home, inhome
  indotfiles_ = File.join dotfiles, indotfiles
  `mkdir -p "$(dirname "#{inhome_}")"`
  `ln -sfT "#{indotfiles_}" "#{inhome_}"`
end
