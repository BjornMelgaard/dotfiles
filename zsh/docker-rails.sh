docker-ruby () {
  docker run \
    -it \
    --rm \
    --name ruby23 \
    -v `pwd`:/usr/src/app \
    -w /usr/src/app \
    ruby:2.3 \
    "$1"
}

#
docker-rails-recreate-db () {
  docker-compose run --rm "$1" bash -c '\
    && rake db:create \
    && (rake db:migrate || true) \
    && rake db:seed \
    && rake db:schema:dump'
}

docker-rails-recreate-db-lite () {
  docker-compose run --rm "$1" bash -c '\
    rake db:drop \
    && rake db:create \
    && rake db:migrate'
}

docker-rails-reset-sessions () {
  docker-compose run --rm "$1" rake tmp:clear
}
