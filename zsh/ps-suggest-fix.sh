ps-suggest-fix () {
  tmpfile=$(mktemp)

  echo "using tmpfile=$tmpfile"
  echo "using \"spago $1 build\""

  # remove dir to force purs output ALL warnings for ALL files
  rm -fdR ./output

  eval "spago $1 build --purs-args \"--json-errors\"" 1>$tmpfile

  cat $tmpfile | ps-suggest --list

  cat $tmpfile | ps-suggest --apply

  sd --flags c 'import Prelude \(.*' 'import Prelude' $(fd --type f ".purs_?" ./)
  sd --flags c 'import Protolude \(.*' 'import Protolude' $(fd --type f ".purs_?" ./)
}
