#! /usr/bin/env ruby

require_relative './config'

`cp -f #{File.join($dotfiles, 'npmrc')} #{File.join($home, '.npmrc')}`
