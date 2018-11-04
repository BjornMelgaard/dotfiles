# npm config set prefix "/home/node/.npm-global"
# export PATH="/home/node/.npm-global/bin:${PATH}"
# npm i -g npm-check-updates
docker-ruby () {
  docker run \
    -it \
    --rm \
    --name "$(basename $PWD)-ruby" \
    -v `pwd`:/usr/src/app \
    -w /usr/src/app \
    starefossen/ruby-node:latest \
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

update-npm-packages () {
  docker run -it --rm -v $(pwd)/package.json:/app/package.json creack/ncu -u --upgradeAll
}
