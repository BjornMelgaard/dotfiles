alias dc="docker-compose"
alias dcu="docker-compose up"

dcRUN () {
  docker-compose run --service-ports --rm "$@"
}

dcRUN! () {
  drmaci
  docker-compose run --service-ports --rm "$@"
  drmaci
  docker-fix-root
}
