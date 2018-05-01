GIT_CRYPT_DIR=$HOME/.git-crypt
GIT_CRYPT_PROJECT=asfd

git-crypt-gpg-mode-to-symmetric-mode () {
  rm -rf .git-crypt
  rm -rf .git/git-crypt
  git-crypt init
  mkdir -p $GIT_CRYPT_DIR
  git-crypt export-key "$GIT_CRYPT_DIR/GIT_CRYPT_PROJECT.key"
}

