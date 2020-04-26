git-remote-setup-fork () {
  origin=$(git remote get-url origin)
  reponame=$(basename $origin)
  echo "Current origin $origin becomes upstream"
  git remote-upsert upstream "$origin"
  git remote-upsert origin "ssh://git@github.com/srghma/$reponame"
}
