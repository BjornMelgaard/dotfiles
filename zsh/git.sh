alias gpa="git push --all"
alias gdiff="git diff"

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

