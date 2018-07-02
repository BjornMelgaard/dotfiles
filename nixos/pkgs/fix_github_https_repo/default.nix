{ stdenv, lib, makeWrapper, git }:

stdenv.mkDerivation rec {
  name = "fix_github_https_repo";

  nativeBuildInputs = [ makeWrapper ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin

    makeWrapper ${./fix_github_https_repo} $out/bin/${name} \
      --prefix PATH : ${lib.makeBinPath [ git ]}
  '';
}
