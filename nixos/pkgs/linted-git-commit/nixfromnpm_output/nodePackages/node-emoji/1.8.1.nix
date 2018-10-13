{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "node-emoji";
    version = "1.8.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/node-emoji/-/node-emoji-1.8.1.tgz";
      sha1 = "6eec6bfb07421e2148c75c6bba72421f8530a826";
    };
    deps = with nodePackages; [
      lodash-toarray_4-4-0
    ];
    meta = {
      homepage = "https://github.com/omnidan/node-emoji#readme";
      description = "simple emoji support for node.js projects";
      keywords = [
        "emoji"
        "simple"
        "emoticons"
        "emoticon"
        "emojis"
        "smiley"
        "smileys"
        "smilies"
        "ideogram"
        "ideograms"
      ];
    };
  }
