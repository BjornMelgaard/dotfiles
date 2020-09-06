let srghma-packages =
      { protolude =
          { dependencies =
              [ "affjax"
              , "console"
              , "effect"
              , "node-fs-aff"
              , "node-process"
              , "node-path"
              , "prelude"
              , "proxy"
              , "psci-support"
              , "record"
              , "typelevel-prelude"
              , "debug"
              , "variant"
              , "ansi"
              , "generics-rep"
              ]
          , repo =
              "https://github.com/srghma/purescript-protolude.git"
          , version =
              "master"
          }
      , halogen-material-components-web =
          { dependencies =
              [ "arrays"
              , "console"
              , "debug"
              , "event"
              , "halogen-svg"
              , "effect"
              , "generics-rep"
              , "halogen"
              , "numbers"
              , "prelude"
              , "psci-support"
              , "record"
              , "strings"
              , "tuples"
              , "either"
              , "foldable-traversable"
              ]
          , repo =
              "https://github.com/srghma/purescript-halogen-material-components-web.git"
          , version =
              "master"
          }
      , web-intersection-observer =
          { dependencies =
              [ "prelude", "web-dom" ]
          , repo =
              "https://github.com/srghma/purescript-web-intersection-observer.git"
          , version =
              "master"
          }
      }

let srghma-forks-published =
        λ(upstream : ./upstreamTypeChunk.dhall)
      → { halogen =
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
                "https://github.com/srghma/purescript-halogen-vdom.git"
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
            ⫽ { repo =
                  "https://github.com/srghma/hyper.git"
              , version =
                  "patch-1"
              }
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
                "https://github.com/srghma/purescript-either.git"
            , version =
                "patch-1"
            }
        }

let srghma-forks-nonpublished =
      { halogen-svg =
          { dependencies =
              [ "prelude" ]
          , repo =
              "https://github.com/srghma/purescript-halogen-svg.git"
          , version =
              "master"
          }
      , halogen-vdom-string-renderer =
          { dependencies =
              [ "prelude", "halogen-vdom", "ordered-collections", "foreign" ]
          , repo =
              "https://github.com/srghma/purescript-halogen-vdom-string-renderer.git"
          , version =
              "master"
          }
      , homogeneous-records =
          { dependencies =
              [ "record"
              , "prelude"
              , "typelevel-prelude"
              , "unfoldable"
              , "control"
              ]
          , repo =
              "https://github.com/srghma/purescript-homogeneous-records.git"
          , version =
              "master"
          }
      }

let other =
      { yarn =
          { dependencies =
              [ "strings", "arrays", "generics-rep", "partial", "unicode" ]
          , repo =
              "https://github.com/Thimoteus/purescript-yarn.git"
          , version =
              "master"
          }
      , unordered-collection =
          { dependencies =
              [ "enums"
              , "functions"
              , "integers"
              , "lists"
              , "prelude"
              , "record"
              , "tuples"
              , "typelevel-prelude"
              ]
          , repo =
              "https://github.com/fehrenbach/purescript-unordered-collections.git"
          , version =
              "master"
          }
      , mkdirp-aff =
          { dependencies =
              [ "prelude"
              , "effect"
              , "node-fs-aff"
              , "node-fs"
              , "node-path"
              , "either"
              , "exceptions"
              , "aff"
              ]
          , repo =
              "https://github.com/leighman/purescript-mkdirp-aff.git"
          , version =
              "master"
          }
      , ps-cst =
          { dependencies =
              [ "console"
              , "effect"
              , "generics-rep"
              , "psci-support"
              , "record"
              , "strings"
              , "spec"
              , "node-path"
              , "node-fs-aff"
              , "ansi"
              , "dodo-printer"
              ]
          , repo =
              "https://github.com/purescript-codegen/purescript-ps-cst.git"
          , version =
              "master"
          }
      , dodo-printer =
          { dependencies =
              [ "aff"
              , "ansi"
              , "avar"
              , "console"
              , "effect"
              , "foldable-traversable"
              , "lists"
              , "maybe"
              , "minibench"
              , "node-child-process"
              , "node-fs-aff"
              , "node-process"
              , "psci-support"
              , "strings"
              ]
          , repo =
              "https://github.com/natefaubion/purescript-dodo-printer.git"
          , version =
              "master"
          }
      }

in    λ(upstream : ./upstreamTypeChunk.dhall)
    →   srghma-packages
      ⫽ srghma-forks-published upstream
      ⫽ srghma-forks-nonpublished
      ⫽ other
