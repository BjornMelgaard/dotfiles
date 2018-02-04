# prefetch with output, that is ready to paste in configuration.nix

nix-my-prefetch-github () {
  repo_url=$1

  owner=`echo $repo_url | sed -Ene's#https://github.com/([^/]*)/(.*)(.git)?#\1#p'`
  if [ -z "$owner" ]; then
    echo "-- ERROR:  Could not identify owner."
    exit
  fi

  repo=`echo $repo_url | sed -Ene's#https://github.com/([^/]*)/(.*)(.git)?#\2#p'`
  if [ -z "$repo" ]; then
    echo "-- ERROR:  Could not identify Repo."
    exit
  fi

  resp=$(nix-prefetch-git $repo_url)

  rev=`echo $resp | grep 'rev' | sed -Ene's#.*\"rev\": \"([^\"]*)\",#\1#p'`
  sha256=`echo $resp | grep 'sha256' | sed -Ene's#.*\"sha256\": \"([^\"]*)\",#\1#p'`

  cat <<EOF


owner = "$owner";
repo = "$repo";
rev = "$rev";
sha256 = "$sha256";
EOF
}
