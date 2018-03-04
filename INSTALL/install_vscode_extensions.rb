#! /usr/bin/env ruby

# XXX
# to update list
# code --list-extensions

extensions = %w[
  HookyQR.beautify
  PeterJausovec.vscode-docker
  UCL.haskelly
  eg2.tslint
  eg2.vscode-npm-script
  felipecaputo.git-project-manager
  eamodio.gitlens
  justusadam.language-haskell
  karunamurti.haml
  rebornix.Ruby
  sianglim.slim
  bbenoist.Nix
]

extensions.each { |e| `code --install-extension #{e}` }
