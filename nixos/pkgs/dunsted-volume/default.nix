{ stdenv, fetchFromGitHub, pkgs, makeWrapper }:

stdenv.mkDerivation rec {
  name = "dunsted-volume-${version}";
  version = "0.1";

  src = /home/bjorn/projects/dunsted-volume;

  buildInputs = [ pkgs.libnotify pkgs.alsaUtils ];
  nativeBuildInputs = [ makeWrapper ];

  installPhase = with stdenv.lib; with pkgs; ''
    install -v -D -m755 ./volume.sh $out/bin/dunsted-volume

    wrapProgram "$out/bin/dunsted-volume" \
      --prefix PATH : ${ makeBinPath [libnotify alsaUtils] }
  '';
}
