decl str-list auto_pairs %((,):{,}:[,]:<,>:",":',':`,`)

def -hidden -params 2 auto-pairs-insert-opener %{ try %{
  exec -draft ';<a-K>[[:alnum:]]<ret>'
  exec -no-hooks "%arg{2}<a-;>H"
}}

def -hidden -params 2 auto-pairs-insert-closer %{ try %{
  exec -draft ";<a-k>\Q%arg{2}<ret>d"
}}

def -hidden -params 2 auto-pairs-delete-opener %{ try %{
  exec -draft ";<a-k>\Q%arg{2}<ret>d"
}}

def -hidden -params 2 auto-pairs-delete-closer %{ try %{
  exec -draft "h<a-k>\Q%arg{1}<ret>d"
}}

def -hidden auto-pairs-insert-new-line %{ try %{
  %sh{
    regex=$(printf '\Q%s\E' "$kak_opt_auto_pairs" | sed s/:/'\\E|\\Q'/g';'s/'<,>'/'<lt>,<gt>'/g';'s/,/'\\E\\n\\h*\\Q'/g)
    echo "exec -draft %(;KGl<a-k>$regex<ret>)"
  }
  exec <up><end><ret>
}}

def -hidden auto-pairs-delete-new-line %{ try %{
  %sh{
    regex=$(printf '\Q%s\E' "$kak_opt_auto_pairs" | sed s/:/'\\E|\\Q'/g';'s/'<,>'/'<lt>,<gt>'/g';'s/,/'\\E\\n\\h*\\Q'/g)
    echo "exec -draft %(;JGi<a-k>$regex<ret>)"
  }
  exec -no-hooks <del>
  exec -draft '<a-i><space>d'
}}

def -hidden auto-pairs-insert-space %{ try %{
  %sh{
    regex=$(printf '\Q%s\E' "$kak_opt_auto_pairs" | sed s/:/'\\E|\\Q'/g';'s/'<,>'/'<lt>,<gt>'/g';'s/,/'\\E\\h\\Q'/g)
    echo "exec -draft %(;2H<a-k>$regex<ret>)"
  }
  exec -no-hooks <space><left>
}}

def -hidden auto-pairs-delete-space %{ try %{
  %sh{
    regex=$(printf '\Q%s\E' "$kak_opt_auto_pairs" | sed s/:/'\\E|\\Q'/g';'s/'<,>'/'<lt>,<gt>'/g';'s/,/'\\E\\h\\Q'/g)
    echo "exec -draft %(;l2H<a-k>$regex<ret>)"
  }
  exec -no-hooks <del>
}}

def auto-pairs-enable -docstring 'Enable automatic closing of pairs' %{
  %sh{
    for pair in $(echo "$kak_opt_auto_pairs" | tr : '\n'); do
      opener=$(echo $pair | cut -d , -f 1)
      closer=$(echo $pair | cut -d , -f 2)
      echo "hook window InsertChar \Q$opener -group auto-pairs-insert %(auto-pairs-insert-opener %-$opener- %-$closer-)"
      echo "hook window InsertDelete \Q$opener -group auto-pairs-delete %(auto-pairs-delete-opener %-$opener- %-$closer-)"
      if [ $opener != $closer ]; then
        echo "hook window InsertChar \Q$closer -group auto-pairs-insert %(auto-pairs-insert-closer %-$opener- %-$closer-)"
        echo "hook window InsertDelete \Q$closer -group auto-pairs-delete %(auto-pairs-delete-closer %-$opener- %-$closer-)"
      fi
    done
  }
  hook window InsertChar \n -group auto-pairs-insert auto-pairs-insert-new-line
  hook window InsertDelete \n -group auto-pairs-delete auto-pairs-delete-new-line
  hook window InsertChar \h -group auto-pairs-insert auto-pairs-insert-space
  hook window InsertDelete \h -group auto-pairs-delete auto-pairs-delete-space
}

def auto-pairs-disable -docstring 'Disable automatic closing of pairs' %{
  remove-hooks window auto-pairs-insert
  remove-hooks window auto-pairs-delete
}

def -hidden -params 2 auto-pairs-surround-insert-opener %{
  exec -draft "<a-;>a%arg{2}"
}

def -hidden -params 2 auto-pairs-surround-delete-opener %{
  exec -draft "<a-;>l<a-k>\Q%arg{2}<ret>d"
}

def auto-pairs-surround -docstring 'Enable automatic closing of pairs on selection boundaries for the whole insert session' %{
  %sh{
    for pair in $(echo "$kak_opt_auto_pairs" | tr : '\n'); do
      opener=$(echo $pair | cut -d , -f 1)
      closer=$(echo $pair | cut -d , -f 2)
      echo "hook window InsertChar \Q$opener -group auto-pairs-surround-insert %(auto-pairs-surround-insert-opener %-$opener- %-$closer-)"
      echo "hook window InsertDelete \Q$opener -group auto-pairs-surround-delete %(auto-pairs-surround-delete-opener %-$opener- %-$closer-)"
    done
  }
  hook window InsertEnd .* -group auto-pairs-surround-insert-end %{
    auto-pairs-enable
    remove-hooks window auto-pairs-surround-insert
    remove-hooks window auto-pairs-surround-delete
    remove-hooks window auto-pairs-surround-insert-end
  }
  auto-pairs-disable
  exec i
}
