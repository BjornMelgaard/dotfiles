# postgresql helpers
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

bitbucket-delete-repository () {
  curdir=${PWD##*/}
  repository=${1:-$curdir}
  curl -X DELETE --user "${BITBUCKET_LOGIN}":"${BITBUCKET_PASS}" https://api.bitbucket.org/2.0/repositories/melgaardbjorn/$repository
}

# https://hackage.haskell.org/package/steeloverseer
hspec-watch () {
  sos $1 -c "stack runhaskell $1"
}
