{
  pkgs ? import <nixpkgs-unstable> {},
  # there are 2 ways of using stack with nix
  # - define custom packages in `stack.yaml` `packages` option (https://docs.haskellstack.org/en/stable/nix_integration/#additions-to-your-stackyaml)
  # - define custom package in `shell.nix` AND `shell-file: ...` in `stack.yaml` (https://docs.haskellstack.org/en/stable/nix_integration/#additions-to-your-stackyaml)
  #
  # we are using second option

  ghc # stack expect this file to define a function of exactly one argument that should be called ghc
}:


with pkgs;

haskell.lib.buildStackProject {
  inherit ghc;
  name = "myEnv";
  buildInputs = [ zlib cabal-install git pcre curl ncurses gmp ];
}
