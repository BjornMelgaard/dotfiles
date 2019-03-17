{ stdenv, pkgconfig, qtbase, qmake, qtsvg, libxml2, postgresql100 }:

stdenv.mkDerivation {
  name = "pgmodeler";
  src = fetchGit {
    url = https://github.com/pgmodeler/pgmodeler;
    ref = "831ed678e84e07d7ab2264f5ec8c3e7adf3a3f09";
  };

  nativeBuildInputs = [ pkgconfig qmake ];
  buildInputs = [ libxml2 postgresql100 qtsvg ];

  configurePhase = ''
    qmake -r PREFIX=$out \
             BINDIR=$out/bin \
             PRIVATEBINDIR=$out \
             PRIVATELIBDIR=$out/lib \
             pgmodeler.pro
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';
}
