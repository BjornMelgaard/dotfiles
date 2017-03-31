# Insert ────────────────────────────────────────────────────────────────────
map global insert <c-d> <del>

# Normal ────────────────────────────────────────────────────────────────────
map global normal ':' ';'
map global normal ';' ':'
map global normal '#' ':comment-line<ret>'

# moving by paragraphs
map global normal <a-p> ']p'
map global normal <a-P> '[p'

# Objects ────────────────────────────────────────────────────────────────────
map global object | :|,|<ret>
map global object / :/,/<ret>

# Some upper-case variants:
map global object P p
map global object I i


# User ───────────────────────────────────────────────────────────────────────
map global user P '!copyq clipboard<ret>'     -docstring 'clipboard paste before'
map global user p '<a-!>copyq clipboard<ret>' -docstring 'clipboard paste after'
map global user R '|copyq clipboard<ret>'     -docstring 'clipboard replace current selection'
map global user y '<a-|>xclip -sel clip<ret>' -docstring 'clipboard yank'
map global user d '<a-|>xclip -sel clip<ret>d' -docstring 'clipboard cut'

map global user s '<esc>:tmux-new-vertical<ret>'   -docstring 'tmux vertical'
map global user v '<esc>:tmux-new-horizontal<ret>' -docstring 'tmux horizontal'

map global user q ':wq<ret>' -docstring 'save and close file'
map global user z ':q!<ret>' -docstring 'close without save'
map global user w ':w<ret>'  -docstring 'save file'

map global user e ':eval %reg{.}<ret>' -docstring 'execute selection'
map global user f '|fmt --width 80<ret>:echo -color Information formated selections<ret>'

# inner line
map global user l 'gi<a-l>'

# Goto ───────────────────────────────────────────────────────────────────────
map global goto p '<esc>:bp<ret>' -docstring 'buffer previous'
map global goto n '<esc>:bn<ret>' -docstring 'buffer next'

map global goto <backspace> ':e *debug*<ret>'
