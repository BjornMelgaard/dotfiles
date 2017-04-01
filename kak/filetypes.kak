hook global BufCreate .*\.?(z|ba|c|k)?sh(rc|env|_profile)? %{ set buffer filetype sh }
hook global BufCreate .*tmux.* %{ set buffer filetype sh }
