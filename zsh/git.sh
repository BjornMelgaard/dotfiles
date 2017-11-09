alias gpa="git push --all"
alias gd="git diff"
alias gg="git graph"
alias glo="git log"
alias gcob="git checkout -b"
alias gpo="git po"

alias gm="git merge"
alias gms="git merge --squash"
alias gmt="git mergetool --tool=meld"
alias gmc="git merge --continue"
alias gma="git merge --abort"

alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"

alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"
alias gcpa="git cherry-pick --abort"

alias gs="git status"

alias gst="git stash"
alias gsta="git stash apply"
alias gsts="git stash show"

alias lc="linted-git-commit"
alias lc!="linted-git-commit --amend"

# !!! DANGER ZONE !!!
alias gco-all="git checkout -- ."
alias grH="git reset HEAD"
alias grH~="git reset HEAD~"
alias grh="git reset --hard"
alias gcln="git clean -fd"
alias git-reset-to-origin="git reset --hard origin/`git rev-parse --abbrev-ref HEAD`"
alias gpf="git push --force"

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

