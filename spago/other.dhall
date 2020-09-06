-- added to pursuit but cannot find
{ yarn =
    { dependencies =
        [ "strings", "arrays", "generics-rep", "partial", "unicode" ]
    , repo =
        "ssh://git@github.com/Thimoteus/purescript-yarn.git"
    , version =
        "master"
    }
-- added to pursuit but cannot find
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
  , version = "master"
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
