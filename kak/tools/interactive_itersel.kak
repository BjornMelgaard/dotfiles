face InterItersel black,green
define-command -hidden -params 3 mark_to_range_faces %{
    %sh{
        printf "set global %s %s" $1 $(echo $2 | sed -e 's/\([:@]\)/|'$3'\1/g' -e 's/\(.*\)@.*%\(.*\)/\2:\1/')
    }
}
define-command -hidden interactive_itersel %{
    try %{
        # >1 sel
        exec -draft <a-space>
        # ensure first selection is the main one
        exec Zz'
        exec -draft <a-space>\"sZ
        mark_to_range_faces phantom_selections %reg{s} InterItersel
        exec <space>
    } catch %{
        # 1 sel
        try %{
            exec \"sz
            reg s ''
            interactive_itersel
        }
    }
}
map global user i :interactive_itersel<ret>
hook global WinCreate .* %{
    add-highlighter ranges phantom_selections
}

