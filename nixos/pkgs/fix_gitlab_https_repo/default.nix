{ stdenv, lib, makeWrapper, git }:

stdenv.mkDerivation rec {
  name = "fix_gitlab_https_repo";

  nativeBuildInputs = [ makeWrapper ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin

    makeWrapper ${./fix_gitlab_https_repo} $out/bin/${name} \
      --prefix PATH : ${lib.makeBinPath [ git ]}
  '';
}
