git-clone-and-cd () {
  cd ~/projects
  git clone $1
  cd ~/projects/$(basename "$1")
}
