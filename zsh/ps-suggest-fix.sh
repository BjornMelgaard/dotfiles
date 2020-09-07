ps-suggest-fix () {
  tmpfile=$(mktemp)

  echo "using tmpfile=$tmpfile"
  echo "using \"spago $1 build\""

  rm -fdR ./output

  eval "spago $1 build --purs-args \"--json-errors\"" 2>$tmpfile

  cat $tmpfile | ps-suggest --list

  cat $tmpfile | ps-suggest --apply

  sd --flags c 'import Prelude.*' 'import Prelude' $(/nix/store/pshda93lw9mzmjy24ml0ly7cfkz480ka-fd-7.4.0/bin/fd --type f ".purs_?" ./)
  sd --flags c 'import Protolude.*' 'import Protolude' $(/nix/store/pshda93lw9mzmjy24ml0ly7cfkz480ka-fd-7.4.0/bin/fd --type f ".purs_?" ./)
}
