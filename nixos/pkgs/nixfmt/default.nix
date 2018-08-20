{
  mkDerivation,
  fetchFromGitHub,
  stdenv,
  alex, base, Earley, fetchgit, happy, parsec, pretty , text
}:

let
  revData = builtins.fromJSON (builtins.readFile ./revision.json);

  url     = revData.url;

  m       = builtins.match "https?://.*/(.*)/(.*)" url;
  owner   = builtins.elemAt m 0;
  repo    = builtins.elemAt m 1;

  src = fetchFromGitHub {
    inherit owner repo;
    inherit (revData) rev sha256;
  };
in

mkDerivation {
  pname = repo;
  version = "1.0.0";
  inherit src;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base Earley parsec pretty text ];
  executableToolDepends = [ alex happy ];
  homepage = url;
  description = "Auto-format Nix code";
  license = stdenv.lib.licenses.bsd3;
}

