SSH_BACKUP="$HOME/.dotfiles/secrets/ssh.tgz"
SSH_DIR="$HOME/.ssh"

ssh-backup () {
  # archive all except hidden
  (cd $SSH_DIR && tar zcf $SSH_BACKUP .)
}

ssh-restore () {
  mkdir -p "$HOME/.ssh"

  tar xzf $SSH_BACKUP --directory $SSH_DIR
}
