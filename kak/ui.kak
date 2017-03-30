# UI |────────────────────────────────────────────────────────────────────

hook global WinCreate .* %{
  addhl number_lines -relative -hlcursor -separator '  '
  addhl show_whitespaces
  addhl show_matching
}

# current word highliting
decl -hidden regex curword
hook global WinCreate .* %{ addhl dynregex '%opt{curword}' 0:+u }
hook global NormalIdle .* %{
  eval -draft %{ try %{
    exec <space><a-i>w <a-k>\`\w+\'<ret>
    set buffer curword "\b\Q%val{selection}E\b"
  } catch %{
    set buffer curword ''
  } }
}

# current search highliting
face CurSearch rgb:f0a0c0,default+u
hook global NormalKey [/?*nN]|<a-[/?*nN]> %{ try %{ addhl dynregex '%reg{/}' 0:CurSearch} }
hook global NormalKey <backspace> %{ try %{ rmhl dynregex_%reg{<slash>} } }

