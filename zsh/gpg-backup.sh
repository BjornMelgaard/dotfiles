GPG_BACKUP_DIR="$HOME/projects/gpg-backup"
USER_EMAIL="melgaardbjorn@gmail.com"

# https://gist.github.com/chrisroos/1205934

gpg-backup () {
  mkdir -p $GPG_BACKUP_DIR

  if [ ! -d "$GPG_BACKUP_DIR/.git" ]; then
    (cd $GPG_BACKUP_DIR && git init)
  fi

  # ownertrust
  gpg --export-ownertrust > $GPG_BACKUP_DIR/ownertrust.txt

  # public key
  gpg -a --export "$USER_EMAIL" > $GPG_BACKUP_DIR/public.gpg

  # secret key
  gpg -a --export-secret-keys  > $GPG_BACKUP_DIR/secret.gpg

  # all public keys
  gpg --armor --export > $GPG_BACKUP_DIR/public-keys.gpg
}

gpg-restore () {
  # import secret key
  gpg --import $GPG_BACKUP_DIR/secret.gpg

  # all public keys
  gpg --import $GPG_BACKUP_DIR/public-keys.gpg

  # ultimately trust user key
  expect -c "spawn gpg --edit-key $USER_EMAIL trust quit; send \"5\ry\r\"; expect eof"

  # ownertrust
  gpg --import-ownertrust $GPG_BACKUP_DIR/ownertrust.txt
}

