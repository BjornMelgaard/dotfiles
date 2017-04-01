%sh{
    autoload() {
        dir=$1
        for rcfile in ${dir}/*.kak; do
            if [ -f "$rcfile" ]; then
                echo "try %{ source '${rcfile}' } catch %{ echo -debug Autoload: could not load '${rcfile}' }";
            fi
        done
        for subdir in ${dir}/*; do
            if [ -d "$subdir" ]; then
                autoload $subdir
            fi
        done
    }
    localconfdir=${XDG_CONFIG_HOME:-${HOME}/.config}/kak
    autoload ${localconfdir}/langs
}

hook global BufCreate .*\.?(z|ba|c|k)?sh(rc|env|_profile)? %{ set buffer filetype sh }
hook global BufCreate .*tmux.* %{ set buffer filetype sh }
