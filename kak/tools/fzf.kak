def -docstring 'invoke fzf to open a file' \
  fzf-file %{ %sh{
   if [ -z "$TMUX" ]; then
      echo echo -color Error only works inside tmux
    else
      FILE=`ag -l -f -p ~/.binignore -p ~/.ignore --hidden --one-device . | fzf-tmux -d 15`
      if [ -n "$FILE" ]; then
        echo "eval -client '$kak_client' 'edit ${FILE}'" | kak -p ${kak_session}
      fi
    fi
}}

def -docstring 'invoke fzf to select a buffer' \
  fzf-buffer %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo -color Error only works inside tmux
    else
      BUFFER=`echo ${kak_buflist} | tr : '\n' | fzf-tmux -d 15`
      if [ -n "$BUFFER" ]; then
        echo "eval -client '$kak_client' 'buffer ${BUFFER}'" | kak -p ${kak_session}
      fi
    fi
}}

def -docstring 'invoke fzf to search file contents' \
  ctrlf %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo -color Error only works inside tmux
    else
      FILE=`ag --nobreak --noheading . | fzf-tmux -d 15`
      if [ -n "$FILE" ]; then
        C1=`echo $FILE | sed -n 's/^\(.*\):[0-9]*:.*/\1/p'`
        C2=`echo $FILE | sed -n 's/^.*:\([0-9]*\):.*/\1/p'`
        tmux neww -a kak $C1 -e "exec ${C2}jk"
      fi
    fi
}}

def fzf-mode %{
  info -title FZF %{
    f: fzf-file
    b: fzf-buffer
  }

  on-key %{ %sh{
  cmd="$(
    case $kak_key in
      f) printf 'fzf-file' ;;
      b) printf 'fzf-buffer' ;;
    esac
  )"
  printf "eval '%s'" "$cmd"
  } }
}

map global user <space> :fzf-mode<ret> -docstring 'fzf'
