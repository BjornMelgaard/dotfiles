decl str-list auto_pairs %(():{}:[]:<>:"":'':``)

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

def auto-pairs-enable %{
  %sh{
    for pair in $(echo "$kak_opt_auto_pairs" | tr : '\n'); do
      opener=$(echo $pair | cut -c 1)
      closer=$(echo $pair | cut -c 2)
      echo "hook window InsertChar \Q$closer -group auto-pairs-insert %(auto-pairs-insert-closer %-$opener- %-$closer-)"
      echo "hook window InsertChar \Q$opener -group auto-pairs-insert %(auto-pairs-insert-opener %-$opener- %-$closer-)"
      echo "hook window InsertDelete \Q$opener -group auto-pairs-delete %(auto-pairs-delete-opener %-$opener- %-$closer-)"
      echo "hook window InsertDelete \Q$closer -group auto-pairs-delete %(auto-pairs-delete-closer %-$opener- %-$closer-)"
    done
  }
}

def auto-pairs-disable %{
  remove-hooks window auto-pairs-insert
  remove-hooks window auto-pairs-delete
}
