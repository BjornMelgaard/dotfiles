let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20200831/packages.dhall sha256:cdb3529cac2cd8dd780f07c80fd907d5faceae7decfcaa11a12037df68812c83

in  { halogen =
        { dependencies =
            upstream.halogen.dependencies
        , repo =
            "https://github.com/srghma/purescript-halogen.git"
        , version =
            "hydration-wip-2"
        }
    , halogen-vdom =
        { dependencies =
            upstream.halogen-vdom.dependencies
        , repo =
            "ssh://git@github.com/srghma/purescript-halogen-vdom.git"
        , version =
            "master"
        }
    , halogen-hooks =
          upstream.halogen-hooks
        ⫽ { repo =
              "https://github.com/srghma/purescript-halogen-hooks.git"
          , version =
              "master"
          }
    , halogen-storybook =
          upstream.halogen-storybook
        ⫽ { repo =
              "https://github.com/srghma/purescript-halogen-storybook.git"
          , version =
              "master"
          }
    , halogen-select =
          upstream.halogen-select
        ⫽ { repo =
              "https://github.com/srghma/purescript-halogen-select.git"
          , version =
              "master"
          }
    , halogen-formless =
          upstream.halogen-formless
        ⫽ { repo =
              "https://github.com/srghma/purescript-halogen-formless.git"
          , version =
              "master"
          }
    , node-http =
          upstream.node-http
        ⫽ { repo =
              "https://github.com/srghma/purescript-node-http.git"
          , version =
              "master"
          }
    , hyper =
          upstream.hyper
        ⫽ { repo = "https://github.com/srghma/hyper.git", version = "patch-1" }
    , web-dom =
          upstream.web-dom
        ⫽ { repo =
              "https://github.com/srghma/purescript-web-dom.git"
          , version =
              "patch-1"
          }
    , media-types =
          upstream.media-types
        ⫽ { repo =
              "https://github.com/srghma/purescript-media-types.git"
          , version =
              "patch-1"
          }
    , dom-indexed =
          upstream.dom-indexed
        ⫽ { repo =
              "https://github.com/srghma/purescript-dom-indexed.git"
          , version =
              "patch-1"
          }
    , argonaut-core =
          upstream.argonaut-core
        ⫽ { repo =
              "https://github.com/srghma/purescript-argonaut-core.git"
          , version =
              "master"
          }
    , slug =
          upstream.slug
        ⫽ { repo =
              "https://github.com/srghma/purescript-slug.git"
          , version =
              "master"
          }
    , foldable-traversable =
        { dependencies =
            upstream.foldable-traversable.dependencies
        , repo =
            "https://github.com/srghma/purescript-foldable-traversable.git"
        , version =
            "master"
        }
    , either =
        { dependencies =
            upstream.either.dependencies
        , repo =
            "ssh://git@github.com/srghma/purescript-either.git"
        , version =
            "patch-1"
        }
    }
