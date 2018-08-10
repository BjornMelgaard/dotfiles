git-crypt-init-repo () {
  git-crypt init
  mkdir -p $HOME/.git-crypt
  git-crypt export-key "$HOME/.git-crypt/$(basename $PWD).key"
}
