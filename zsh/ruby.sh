# sqlite
# alias rails-recreate-db="rails db:migrate VERSION=0 && rails db:drop && rails db:migrate"

# postgre
alias rails-recreate-db="rails db:drop && rails db:create && rails db:migrate"

alias gem-install-defaults="gem install bundler neovim rubocop"

rvm-new-project() {
  ruby_version='2.3.1'
  curdir=${PWD##*/}
  gemset_name=${2:-$curdir}
  rvm --create --ruby-version ruby-$ruby_version@$gemset_name
}

