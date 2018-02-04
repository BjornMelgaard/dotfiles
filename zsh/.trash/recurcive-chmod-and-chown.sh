chmodf() {
  find $2 -type f -exec chmod $1 {} \;
}

chmodd() {
  find $2 -type d -exec chmod $1 {} \;
}

