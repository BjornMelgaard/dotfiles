link-purescript-project () {( set -e
  project="$1"
  depname="$2"
  to="${3:-"$HOME/projects/purescript-$2"}"
  version=$(cd $project && (spago sources | grep ".spago/$depname/" | /nix/store/s8mprbmgm91vlvgdg5lfvyhmfdbx88k2-sd-0.6.5/bin/sd '[^/]+/[^/]+/([^/]+)/.*' '$1'))

  [ -z "$version" ] && (echo "Empty for $project/.spago/$depname ($to)" && exit 1)

  echo "linking $project/.spago/$depname to $to (version = $version)"
  rmf "$project/.spago/$depname" && mkdir -p "$project/.spago/$depname" && ln -s "$to" "$project/.spago/$depname/$version"
)}

link-purescript-project-halogen () {( set -e
  rm -dRf ~/projects/purescript-halogen-nextjs/node_modules/webpack-spago-loader && ln -s ~/projects/webpack-spago-loader ~/projects/purescript-halogen-nextjs/node_modules

  link-purescript-project $HOME/projects/purescript-halogen-vdom web-dom

  link-purescript-project $HOME/projects/purescript-halogen halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen web-dom

  link-purescript-project $HOME/projects/purescript-halogen-reactnative halogen
  link-purescript-project $HOME/projects/purescript-halogen-reactnative halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-reactnative web-dom

  link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen
  link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-nextjs web-dom
  link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen-formless
  link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen-select
  link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen-storybook
  link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen-hooks
  link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen-hooks-extra
  link-purescript-project $HOME/projects/purescript-halogen-nextjs hyper $HOME/projects/hyper
  # link-purescript-project $HOME/projects/purescript-halogen-nextjs halogen-realworld

  link-purescript-project $HOME/projects/purescript-halogen-realworld halogen
  link-purescript-project $HOME/projects/purescript-halogen-realworld halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-realworld web-dom
  link-purescript-project $HOME/projects/purescript-halogen-realworld halogen-formless
  link-purescript-project $HOME/projects/purescript-halogen-realworld halogen-select
  link-purescript-project $HOME/projects/purescript-halogen-realworld halogen-storybook
  link-purescript-project $HOME/projects/purescript-halogen-realworld halogen-hooks
  link-purescript-project $HOME/projects/purescript-halogen-realworld halogen-hooks-extra

  link-purescript-project $HOME/projects/purescript-halogen-formless halogen
  link-purescript-project $HOME/projects/purescript-halogen-formless halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-formless web-dom
  link-purescript-project $HOME/projects/purescript-halogen-formless halogen-select
  link-purescript-project $HOME/projects/purescript-halogen-formless halogen-storybook

  link-purescript-project $HOME/projects/purescript-halogen-select halogen
  link-purescript-project $HOME/projects/purescript-halogen-select halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-select web-dom
  link-purescript-project $HOME/projects/purescript-halogen-select halogen-hooks
  link-purescript-project $HOME/projects/purescript-halogen-select halogen-hooks-extra

  link-purescript-project $HOME/projects/purescript-halogen-storybook halogen
  link-purescript-project $HOME/projects/purescript-halogen-storybook halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-storybook web-dom

  link-purescript-project $HOME/projects/purescript-halogen-hooks halogen
  link-purescript-project $HOME/projects/purescript-halogen-hooks halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-hooks web-dom

  link-purescript-project $HOME/projects/purescript-halogen-hooks-extra halogen
  link-purescript-project $HOME/projects/purescript-halogen-hooks-extra halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-hooks-extra web-dom
  link-purescript-project $HOME/projects/purescript-halogen-hooks-extra halogen-hooks

  link-purescript-project $HOME/projects/purescript-halogen-formless halogen
  link-purescript-project $HOME/projects/purescript-halogen-formless halogen-vdom
  link-purescript-project $HOME/projects/purescript-halogen-formless web-dom
  link-purescript-project $HOME/projects/purescript-halogen-formless halogen-hooks
  link-purescript-project $HOME/projects/purescript-halogen-formless halogen-hooks-extra
  link-purescript-project $HOME/projects/purescript-halogen-formless halogen-select
)}

link-purescript-project-all () {( set -e
  link-purescript-project $HOME/projects/purescript-graphql-client ps-ast
)}
