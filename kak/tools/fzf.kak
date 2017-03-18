def fzf-file %{ %sh{
    if [ -z "$TMUX" ]; then
        printf "echo only works inside tmux"
    else
        file="$(fzf-tmux -d 10)"
        if [ -n "$file" ]; then
            printf "eval 'edit %s'" "$file"
        fi
    fi
} }

def fzf-buffer %{ %sh{
    if [ -z "$TMUX" ]; then
        printf "echo only works inside tmux"
    else
        buffer="$(echo ${kak_buflist} | tr : '\n' | fzf-tmux -d 10)"
        if [ -n "$buffer" ]; then
            printf "eval 'buffer %s'" "$buffer"
        fi
    fi
} }

def -hidden fzf-mode %{ on-key %{ %sh{
    cmd="$(
        case $kak_key in
            f) printf 'fzf-file' ;;
            b) printf 'fzf-buffer' ;;
        esac
    )"
    printf "eval '%s'" "$cmd"
} } }

