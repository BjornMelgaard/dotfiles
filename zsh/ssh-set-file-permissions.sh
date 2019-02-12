ssh-set-file-permissions () {
  sudo chmod 700 -R $HOME/.ssh
  sudo chown "$USER":wheel -R $HOME/.ssh

  sudo chmod 600 $HOME/.ssh/*
  sudo chmod 644 $HOME/.ssh/*.pub

  sudo chmod 644 $HOME/.ssh/config
  sudo chmod 644 $HOME/.ssh/known_hosts
}
