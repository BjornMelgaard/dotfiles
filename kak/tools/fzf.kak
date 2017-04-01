def fzf-tag %{
  fzf "tag" "readtags -l | cut -f1 | sort -u"
}

def fzf-project %{ %sh{
  if [ -z "$TMUX" ]; then
    echo echo -color Error only works inside tmux
  else
    BUFFER=`(cd $(git rev-parse --show-toplevel) && ag --ignore .git --ignore .cache --ignore .old --hidden -g "") | fzf-tmux -d 15`
    if [ -n "$BUFFER" ]; then
      echo "eval -client '$kak_client' 'edit ${BUFFER}'" | kak -p ${kak_session}
    fi
  fi
} }

def fzf-buffer %{ %sh{
  if [ -z "$TMUX" ]; then
    echo echo -color Error only works inside tmux
  else
    BUFFER=`echo ${kak_buflist} | tr : '\n' | fzf-tmux -d 15`
    if [ -n "$BUFFER" ]; then
      echo "eval -client '$kak_client' 'buffer ${BUFFER}'" | kak -p ${kak_session}
    fi
  fi
}}

map global user <space> :fzf-project<ret> -docstring 'fzf-project'
map global user b :fzf-buffer<ret> -docstring 'fzf-buffer'
