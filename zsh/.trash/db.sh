postgresql-reinstall () {
  sudo systemctl stop postgresql
  sudo pacman -Rcns --noconfirm postgresql
  sudo rm -rfd /var/lib/postgres/data
  sudo pacman -S --noconfirm postgresql
  sudo su - postgres -c "initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'"
  sudo systemctl start postgresql
}

postgresql-new-project () {
  sudo su - postgres -c "createuser -d $1 "\
    "&& createdb -O $1 $1_development "\
    "&& createdb -O $1 $1_test"
}

