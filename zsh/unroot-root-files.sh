unroot-root-files() {
  # * doesn't include hidden files by default
  sudo chown --from=root:root -R `whoami`:users ./*
  # hidden files
  sudo chown --from=root:root -R `whoami`:users ./.[^.]*
}

