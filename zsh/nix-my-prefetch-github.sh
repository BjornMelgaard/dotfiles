# prefetch with output, that is ready to paste in configuration.nix

# from https://garbas.si/2016/updating-your-nix-sources.html
# from https://github.com/mozilla/release-services/blob/6b70541388dd267a9027979bc75e0ab7975a19ee/nix/lib/default.nix#L364

nix-my-prefetch-github () {
  owner=$1
  repo=$2
  branch=$3

  github_rev() {
    curl -sSf "https://api.github.com/repos/$1/$2/branches/$3" | \
      jq '.commit.sha' | \
      sed 's/"//g'
  }

  github_sha256() {
    nix-prefetch-url --unpack "https://github.com/$1/$2/archive/$3.tar.gz" 2>&1 | tail -n 1
  }

  echo "=== $owner/$repo@$branch ==="

  echo -n "Looking up latest revision ... "

  rev=$(github_rev "$owner" "$repo" "$branch");
  echo "revision is \`$rev\`."

  sha256=$(github_sha256 "$owner" "$repo" "$rev");
  echo "sha256 is \`$sha256\`."

  cat <<REPO
{
  owner  = "$owner";
  repo   = "$repo";
  rev    = "$rev";
  sha256 = "$sha256";
}
REPO
  echo
}
