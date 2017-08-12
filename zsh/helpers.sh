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
  repo_name=${1:-$curdir}
  curl -X DELETE --user "${BITBUCKET_LOGIN}":"${BITBUCKET_PASS}" https://api.bitbucket.org/2.0/repositories/melgaardbjorn/$repository
}


github-force-add-ssh-remote () {
  remote_name=${1:-origin}
  curdir=${PWD##*/}
  repo_name=${2:-$curdir}
  username='BjornMelgaard'
  git remote rm $remote_name
  git remote add $remote_name git@github.com:$username/$repo_name.git
}

github-push-all () {
  git push --set-upstream origin --all
  git push --set-upstream origin --tags
}

github-push-current_branch () {
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  git push --set-upstream origin $current_branch
}

github-create-and-upload () {
  curdir=${PWD##*/}
  repo_name=${1:-$curdir}
  username='BjornMelgaard'
  curl -u $username https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
  git remote rm origin
  git remote add origin git@github.com:$username/$repo_name.git
  github-push-all
}

tmuxp-new () {
  arg_or_dev=${1:-dev}
  fullname="tmuxp.$arg_or_dev.yaml"
  touch $fullname
  cat <<EOF > $fullname
session_name: $arg_or_dev
start_directory: ./ # session file directory
windows:
- window_name: dev window
  layout: tiled
  panes:
    - shell_command:           # pane no. 1
        - cd /var/log          # run multiple commands in this pane
        - ls -al | grep \.log
    - echo second pane         # pane no. 2
    - echo third pane          # pane no. 3
    - echo forth pane          # pane no. 4
EOF
  nvim $fullname
}


# https://hackage.haskell.org/package/steeloverseer
hspec-watch () {
  sos $1 -c "stack runhaskell $1"
}
