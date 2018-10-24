#!/bin/sh

nvim +PlugInstall +UpdateRemotePlugins +qa

(cd ~/.config/nvim/bundle/repos/github.com/autozimu/LanguageClient-neovim && ./install.sh)

nvim +PlugInstall +UpdateRemotePlugins +qa
