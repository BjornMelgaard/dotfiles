# link-purescript-project $HOME/projects/purescript-halogen/.spago/halogen-vdom        $HOME/projects/purescript-halogen-vdom "v6.1.3"
# link-purescript-project $HOME/projects/purescript-halogen-nextjs/.spago/halogen-vdom $HOME/projects/purescript-halogen-vdom
# link-purescript-project $HOME/projects/purescript-halogen-nextjs/.spago/halogen      $HOME/projects/purescript-halogen
# link-purescript-project $HOME/projects/purescript-halogen-realworld/.spago/halogen   $HOME/projects/purescript-halogen "v5.0.0-rc.9"

link-purescript-project () {
  from="$1"
  to="$2"
  version="${3:-master}"
  echo "linking $from to $to (version = $version)"
  rmf "$from" && mkdir -p "$from" && ln -s "$to" "$from/$version"
}
