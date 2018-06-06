grep_and_rm () {
  grep -e "$1" **/*.rake **/*.rb -l | xargs -d '\n' rm
}
