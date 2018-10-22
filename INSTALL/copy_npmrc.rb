#! /usr/bin/env nix-shell
#! nix-shell -i ruby -p ruby

# XXX: copy, instead of link, because npm adds secret access_token to it
require_relative './config'

`cp -f #{File.join($dotfiles, 'npmrc')} #{File.join($home, '.npmrc')}`
