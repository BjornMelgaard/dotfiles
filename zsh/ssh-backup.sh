SSH_BACKUP="$HOME/.dotfiles/secrets/ssh.tgz"
SSH_DIR="$HOME/.ssh"

ssh-backup () {
  # archive all except hidden
  rm -f $SSH_BACKUP

  (cd $SSH_DIR && tar zcf $SSH_BACKUP .)
}

ssh-restore () {
  mkdir -p "$SSH_DIR"

  tar xzf $SSH_BACKUP --directory $SSH_DIR
}
