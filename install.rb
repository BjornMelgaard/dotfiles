# !/usr/bin/env nix-shell
# !nix-shell -i ruby -p ruby

inhome_indotfiles = [
  ['.zshrc',       'zshrc'],
  ['.config/nvim', 'nvim']
]

dotfiles = Dir.pwd
home = ENV['HOME']

inhome_indotfiles.each do |(inhome, indotfiles)|
  inhome_     = File.join home, inhome
  indotfiles_ = File.join dotfiles, indotfiles
  `mkdir -p "$(dirname "#{inhome_}")"`
  `ln -sfT "#{indotfiles_}" "#{inhome_}"`
end
