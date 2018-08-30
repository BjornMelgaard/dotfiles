NET_MGR_BACKUP="$HOME/.dotfiles/secrets/net-mgr.tgz"
NET_MGR_DIR="/etc/NetworkManager/system-connections"

net-mgr-backup () {
  # archive all except hidden
  rm -f $NET_MGR_BACKUP

  sudo bash -c "cd $NET_MGR_DIR && tar zcf $NET_MGR_BACKUP ."
}

net-mgr-restore () {
  sudo bash -c "mkdir -p $NET_MGR_DIR && tar xzf $NET_MGR_BACKUP --directory $NET_MGR_DIR"
}
