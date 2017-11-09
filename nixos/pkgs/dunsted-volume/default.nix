{ stdenv, fetchFromGitHub, pkgs }:

stdenv.mkDerivation rec {
  name = "dunsted-volume-${version}";
  version = "0.1";

  # src = fetchFromGitHub {
  #   owner = "BjornMelgaard";
  #   repo = "dunsted-volume";
  #   rev = "fdae02de51d940db59004ac93c24530cdb972376";
  #   sha256 = "1wp30lsqyz17swxhml2ryn7kx32kf8r1fcc244cwchzi77bwjv6c";
  # };

  src = /home/bjorn/projects/dunsted-volume;

  buildInputs = [ pkgs.libnotify pkgs.alsaUtils ];

  installPhase = ''
    install -v -D -m755 ./volume.sh $out/bin/dunsted-volume

    substituteInPlace $out/bin/dunsted-volume \
      --subst-var-by bash "${pkgs.bash}" \
      --subst-var-by coreutils "${pkgs.coreutils}" \
      --subst-var-by libnotify "${pkgs.libnotify}" \
      --subst-var-by alsaUtils "${pkgs.alsaUtils}"
  '';
}
