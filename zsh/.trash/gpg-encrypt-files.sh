encrypt-all () {
  printf "Enter passphrase: "
  read -s pass

  for file in "$@"
  do
    echo "${pass}" | gpg --batch --no-tty --yes --passphrase-fd 0 --symmetric "${file}"
  done
}

decrypt-all () {
  printf "Enter passphrase: "
  read -s pass

  echo "${pass}" | gpg --batch --no-tty --yes --passphrase-fd 0 --decrypt-files "$@"
}
