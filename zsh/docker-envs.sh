docker-ruby () {
  docker run \
    -it \
    --rm \
    --name "$(basename $PWD)-ruby23" \
    -v `pwd`:/usr/src/app \
    -w /usr/src/app \
    ruby:2.3 \
    "$@"
}

docker-python () {
  docker run \
    -it \
    --rm \
    --name "$(basename $PWD)-python3" \
    -v `pwd`:/usr/src/app \
    -w /usr/src/app \
    python:3 \
    "$@"
}

docker-node () {
  docker run \
    --user node:node \
    -it \
    --rm \
    --name "$(basename $PWD)-node9" \
    -v "$PWD":/usr/src/app \
    -w /usr/src/app \
    node:9-stretch \
    bash
}
