# Bindings ────────────────────────────────────────────────────────────────────

map global normal ':' ';'
map global normal ';' ':'

map global normal '#' ':comment-line<ret>'

map global user P '!copyq clipboard<ret>'     -docstring 'clipboard paste before'
map global user p '<a-!>copyq clipboard<ret>' -docstring 'clipboard paste after'
map global user R '|copyq clipboard<ret>'     -docstring 'clipboard replace current selection'
map global user y '<a-|>xclip -sel clip<ret>' -docstring 'clipboard yank'
map global user d '<a-|>xclip -sel clip<ret>d' -docstring 'clipboard cut'

map global user s '<esc>:tmux-new-vertical<ret>'   -docstring 'tmux vertical'
map global user v '<esc>:tmux-new-horizontal<ret>' -docstring 'tmux horizontal'

map global user h ':bp<ret>' -docstring 'buffer previous'
map global user l ':bn<ret>' -docstring 'buffer next'

map global user q ':wq<ret>' -docstring 'save and close file'
map global user z ':q!<ret>' -docstring 'close without save'
map global user w ':w<ret>'  -docstring 'save file'

map global user e ':eval %reg{.}<ret>' -docstring 'execute selection'
map global user f '|fmt --width 80<ret>:echo -color Information formated selections<ret>'

#map global user l ':bn<ret>'
