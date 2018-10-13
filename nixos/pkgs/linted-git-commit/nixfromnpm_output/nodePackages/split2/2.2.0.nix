{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "split2";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/split2/-/split2-2.2.0.tgz";
      sha1 = "186b2575bcf83e85b7d18465756238ee4ee42493";
    };
    deps = with nodePackages; [
      through2_2-0-3
    ];
    meta = {
      homepage = "https://github.com/mcollina/split2#readme";
      description = "split a Text Stream into a Line Stream, using Stream 3";
    };
  }
