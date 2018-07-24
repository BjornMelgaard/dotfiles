mkdcd () {
  mkdir -p $1

  # cd last
  cd $(ls -tU | head -n 1)
}
