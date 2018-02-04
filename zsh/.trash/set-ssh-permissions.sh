set-ssh-permissions () {
  sudo chmod 700 -R ~/.ssh
  sudo chown $USER -R ~/.ssh

  sudo chmod 600 ~/.ssh/*
  sudo chmod 644 ~/.ssh/*.pub

  sudo chmod 644 ~/.ssh/config
  sudo chmod 644 ~/.ssh/known_hosts
}
