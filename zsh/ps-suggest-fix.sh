ps-suggest-fix () {
  tmpfile=$(mktemp)
  echo "tmpfile=$tmpfile"
  rm -fdR ./output
  spago build --purs-args "--json-errors" 2>$tmpfile

  cat $tmpfile | ps-suggest --list

  cat $tmpfile | ps-suggest --apply
}
