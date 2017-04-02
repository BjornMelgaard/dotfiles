def -hidden copy_merged_selections %{ nop %sh{
  printf %s "$kak_selections" | sed -e 's/^://g' -e 's/\([^\\]\):/\1\n/g' -e 's/\\\\/\\/g' -e 's/\\:/:/g' | xsel --input --clipboard
} }

map global normal y ':copy_merged_selections<ret>y'

map global normal d \"_d
map global normal c \"_c
map global user   d ':copy_merged_selections<ret>d'
map global user   c ':copy_merged_selections<ret>c'

map global user p '<a-!>copyq clipboard<ret>' -docstring 'clipboard paste after'
map global user P '!copyq clipboard<ret>'     -docstring 'clipboard paste before'
map global user R '|copyq clipboard<ret>'     -docstring 'clipboard replace current selection'
