# Insert  Command line ────────────────────────────────────────────────────────────────────
map global insert <c-f> <del>
map global prompt <c-f> <del>
map global insert <c-d> <backspace>
map global prompt <c-d> <backspace>

# map global insert <a-backspace> '<a-;><lt>'

# # delete to start
# map global insert <c-u> <esc><a-h>di

# # delete previous word
# map global insert <c-w> '<a-;>:exec -draft bd<ret>'
# #map global prompt <c-w> <> # #TODO: wait https://github.com/mawww/kakoune/pull/800

# # move by chars
# map global insert <a-h> <left>
# map global insert <a-l> <right>

# # move by words
# map global insert <a-o> <esc>el\;i
# map global insert <a-u> <esc>b\;i
# map global prompt <a-o> <c-e><right>
# map global prompt <a-u> <c-b>

# map global insert <a-O> <esc><a-e>l\;i
# map global insert <a-U> <esc><a-b>\;i
# map global prompt <a-O> <c-a-e><right>
# map global prompt <a-U> <c-a-b>

# # move by lines
# map global insert <a-d> <home>
# map global insert <a-f> <end>
# map global prompt <a-d> <home>
# map global prompt <a-f> <end>

# Normal ────────────────────────────────────────────────────────────────────
# swap : and ;
map global normal ';' ':'
map global normal ':' ';'

# # swap , and <space>
# map global normal <space> ','
# map global normal ',' <space>

# # vimlike half page movements
# map global normal <c-u> gtvc
# map global normal <c-d> <c-d>gc

# map global normal '#' :comment-line<ret>

# # moving by paragraphs
# map global normal <a-[> [p
# map global normal <a-]> ]p
# map global normal <a-}> }p
# map global normal <a-{> {p

# map global normal = ':prompt math: %{exec "a%val{text}<lt>esc>|bc<lt>ret>"}<ret>'

# # Objects ────────────────────────────────────────────────────────────────────
# map global object | :|,|<ret>
# map global object / :/,/<ret>

# # some upper-case variants:
# map global object P p
# map global object I i

# # User ───────────────────────────────────────────────────────────────────────
# map global user _ '<esc>:tmux-new-vertical<ret>'   -docstring 'tmux vertical'
# map global user | '<esc>:tmux-new-horizontal<ret>' -docstring 'tmux horizontal'

# map global user q ':wq<ret>' -docstring 'save and close file'
# map global user z ':q!<ret>' -docstring 'close without save'
# map global user w ':w<ret>'  -docstring 'save file'

# map global user e ':eval %reg{.}<ret>' -docstring 'execute selection'
# map global user l 'gi<a-l>' -docstring 'inner line'
# map global user s :auto-pairs-surround<ret>

# # Goto ───────────────────────────────────────────────────────────────────────
# map global goto p '<esc>:bp<ret>' -docstring 'buffer previous'
# map global goto n '<esc>:bn<ret>' -docstring 'buffer next'

# map global goto <backspace> '<esc>:e *debug*<ret>' -docstring 'open *debug*'
