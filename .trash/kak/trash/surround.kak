def -hidden surround %!on-key %@exec -no-hooks %sh&
  case "$kak_key" in
  "<lt>") key="<" ;;
  "<gt>") key=">" ;;
  "<space>") key=" " ;;
  "<tab>") key="\t" ;;
  \<*\>) echo ":echo<space>no<ret>"; exit 1 ;;
  *) key="$kak_key" ;;
  esac

  open="$key"
  close="$key"
  case "$key" in
  ")") open="(" ;;
  "]") open="[" ;;
  "}") open="{" ;;
  ">") open="<" ;;
  "(") open="( "; close=" )" ;;
  "[") open="[ "; close=" ]" ;;
  "{") open="{ "; close=" }" ;;
  "<") open="< "; close=" >" ;;
  esac

  epilogue=${close//?/H}

  open=${open/</<lt>}
  close=${close/>/<gt>}

  open=${open/ /<space>}
  close=${close/ /<space>}

  echo "i$open<esc>a$close<esc>$epilogue"
&@!

def -hidden delete-surround %{on-key %{exec -no-hooks %sh{
  echo "<a-a>${kak_key}a<backspace><esc>i<del><esc>"
}}}

def -hidden change-surround %{on-key %{ %sh{ printf %s\\n "
  on-key %{ %sh{
    echo echo ${kak_key} \${kak_key}
  }}
" }}}

def -hidden surround-mode %{
  info -title 'Surround mode' %{
    s: surround
    d: delete surround
    c: change surround
  }

  on-key %{ %sh{
  cmd="$(
      case $kak_key in
        s) printf 'surround' ;;
        d) printf 'delete-surround' ;;
        c) printf 'change-surround' ;;
      esac
  )"
  printf "eval '%s'" "$cmd"
}}}

map global user s ":surround-mode<ret>" -docstring 'surround mode'

