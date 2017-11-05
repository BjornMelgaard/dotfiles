def -hidden -params 1 unimpair-next %{
  info -title Next %{
    b: buffer next
  }
  on-key %{ %sh{
    case $kak_key in
      b) echo buffer-next ;;
      $1) echo exec $1p ;;
      *) echo exec $1$kak_key ;;
    esac
  } }
}

def -hidden -params 1 unimpair-previous %{
  info -title Previous %{
    b: buffer previous
    %opt{1}: paragraph
  }
  on-key %{ %sh{
    case $kak_key in
      b) echo buffer-previous ;;
      $1) echo exec $1p ;;
      *) echo exec $1$kak_key ;;
    esac
  } }
}

def unimpaired-enable %<
  map global normal ] ':unimpair-next ]<ret>'
  map global normal [ ':unimpair-previous [<ret>'
  map global normal } ':unimpair-next }<ret>'
  map global normal { ':unimpair-previous {<ret>'
>

def unimpaired-disable %<
  map global normal ] ']'
  map global normal [ '['
  map global normal } '}'
  map global normal { '{'
>

