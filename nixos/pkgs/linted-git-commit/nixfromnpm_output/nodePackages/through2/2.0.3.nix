{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "through2";
    version = "2.0.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/through2/-/through2-2.0.3.tgz";
      sha1 = "0004569b37c7c74ba39c43f3ced78d1ad94140be";
    };
    deps = with nodePackages; [
      xtend_4-0-1
      readable-stream_2-3-6
    ];
    meta = {
      homepage = "https://github.com/rvagg/through2#readme";
      description = "A tiny wrapper around Node streams2 Transform to avoid explicit subclassing noise";
      keywords = [
        "stream"
        "streams2"
        "through"
        "transform"
      ];
    };
  }
