ps-suggest-fix () {
  tmpfile=$(mktemp)
  echo "tmpfile=$tmpfile"
  rm -fdR ./output
  spago $1 build --purs-args "--json-errors" 2>$tmpfile

  cat $tmpfile | ps-suggest --list

  cat $tmpfile | ps-suggest --apply

  sd --flags c 'import Prelude.*' 'import Prelude' $(/nix/store/pshda93lw9mzmjy24ml0ly7cfkz480ka-fd-7.4.0/bin/fd --type f ".purs_?" ./)
}
