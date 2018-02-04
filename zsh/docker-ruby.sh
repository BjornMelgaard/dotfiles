docker-ruby () {
  docker run \
    -it \
    --rm \
    --name ruby23 \
    -v `pwd`:/usr/src/app \
    -w /usr/src/app \
    ruby:2.3 \
    "$@"
}
