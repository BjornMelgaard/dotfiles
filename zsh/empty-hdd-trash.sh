empty-hdd-trash () {
  hdd_dirs=(Documents Downloads Music Pictures Videos)
  for dir in $hdd_dirs
  do
    rm -fdR ~/$dir/.Trash-1000
  done
}
