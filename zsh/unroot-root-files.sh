unroot-root-files () {
  # * doesn't include hidden files by default
  sudo chown --from=root:root -R `whoami`:users ./* && sudo chown --from=root:root -R `whoami`:users ./.[^.]*
}

