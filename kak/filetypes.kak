hook global BufCreate .*\.?(z|ba|c|k)?sh(rc|env|_profile)? %{
    set buffer filetype sh
}

