alias dc="docker-compose"
alias dcu="docker-compose up"

alias dcrs="docker-compose run --rm --service-ports"
alias dcrsn="docker-compose run --rm --no-deps --service-ports"
alias dcrn="docker-compose run --rm --no-deps"

# example: dcrn_f dev be bash
dcr_f () {
  docker-compose -p "$1" -f "docker/$1.yml" run --rm "${@:2}"
}

dcrs_f () {
  docker-compose -p "$1" -f "docker/$1.yml" run --rm --service-ports "${@:2}"
}

dcrsn_f () {
  docker-compose -p "$1" -f "docker/$1.yml" run --rm --no-deps --service-ports "${@:2}"
}

dcrn_f () {
  docker-compose -p "$1" -f "docker/$1.yml" run --rm --no-deps "${@:2}"
}

dcrs! () {
  drmaci
  docker-compose run --service-ports --rm "$@"
  drmaci
  unroot-root-files
}

dcrs_f! () {
  drmaci
  dcrs_f "$@"
  drmaci
  unroot-root-files
}
