#! /usr/bin/env nix-shell
#! nix-shell -i ruby -p ruby

# XXX
# to update list
# code --list-extensions

extensions = %w[
  alanz.vscode-hie-server
  bbenoist.nix
  castwide.solargraph
  eamodio.gitlens
  eg2.tslint
  eg2.vscode-npm-script
  felipecaputo.git-project-manager
  justusadam.language-haskell
  karunamurti.haml
  Kasik96.swift
  ms-python.python
  PeterJausovec.vscode-docker
  rebornix.ruby
  sianglim.slim
]

extensions.each { |e| `code --install-extension #{e}` }
