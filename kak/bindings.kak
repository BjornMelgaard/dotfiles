# Insert  Command line ────────────────────────────────────────────────────────────────────
map global insert <a-d> <del>
map global insert <a-x> <backspace>

# delete to start
map global insert <c-u> <esc><a-h>di

# delete previous word
map global insert <a-w> '<a-;>:exec -draft bd<ret>'

# move by chars
map global insert <a-h> <left>
map global insert <a-l> <right>

# move by words
map global insert <c-w> <esc>w\;i
map global insert <c-b> <esc>b\;i
map global insert <c-e> <esc>el\;i
#map global insert <c-a-w> <esc><a-w>\;i
#map global insert <c-a-b> <esc><a-b>\;i
#map global insert <c-a-e> <esc><a-e>l\;i

# move by lines
map global insert <a-u> <home>
map global insert <a-o> <end>
map global prompt <a-u> <home>
map global prompt <a-o> <end>

# Normal ────────────────────────────────────────────────────────────────────
map global normal ';' ':'
map global normal ':' ';'
map global normal <c-u> <c-u>gc
map global normal <c-d> <c-d>gc

map global normal '#' :comment-line<ret>

# moving by paragraphs
map global normal <a-[> [p
map global normal <a-]> ]p
map global normal <a-}> }p
map global normal <a-{> {p

map global normal = ':prompt math: %{exec "a%val{text}<lt>esc>|bc<lt>ret>"}<ret>'

# Objects ────────────────────────────────────────────────────────────────────
map global object | :|,|<ret>
map global object / :/,/<ret>

# some upper-case variants:
map global object P p
map global object I i


# User ───────────────────────────────────────────────────────────────────────
map global user P '!copyq clipboard<ret>'     -docstring 'clipboard paste before'
map global user p '<a-!>copyq clipboard<ret>' -docstring 'clipboard paste after'
map global user R '|copyq clipboard<ret>'     -docstring 'clipboard replace current selection'
map global user y '<a-|>xclip -sel clip<ret>' -docstring 'clipboard yank'
map global user d '<a-|>xclip -sel clip<ret>d' -docstring 'clipboard cut'

map global user _ '<esc>:tmux-new-vertical<ret>'   -docstring 'tmux vertical'
map global user | '<esc>:tmux-new-horizontal<ret>' -docstring 'tmux horizontal'

map global user q ':wq<ret>' -docstring 'save and close file'
map global user z ':q!<ret>' -docstring 'close without save'
map global user w ':w<ret>'  -docstring 'save file'

map global user e ':eval %reg{.}<ret>' -docstring 'execute selection'
#map global user f '|fmt --width 80<ret>:echo -color Information formated selections<ret>'

map global user l 'gi<a-l>' -docstring 'inner line'

# Goto ───────────────────────────────────────────────────────────────────────
map global goto p '<esc>:bp<ret>' -docstring 'buffer previous'
map global goto n '<esc>:bn<ret>' -docstring 'buffer next'

map global goto <backspace> '<esc>:e *debug*<ret>' -docstring 'open *debug*'
