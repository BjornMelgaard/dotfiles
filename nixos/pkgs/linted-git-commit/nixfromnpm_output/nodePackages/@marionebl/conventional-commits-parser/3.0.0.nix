{ buildNodePackage, fetchUrlNamespaced, namespaceTokens, nodePackages, pkgs }:
buildNodePackage {
    name = "conventional-commits-parser";
    version = "3.0.0";
    src = fetchUrlNamespaced {
      url = "https://registry.npmjs.org/@marionebl/conventional-commits-parser/-/conventional-commits-parser-3.0.0.tgz";
      sha1 = "9da29b4d2c8f05c0f9cdd02936713b8096c958d3";
      namespace = "marionebl";
    };
    namespace = "marionebl";
    deps = with nodePackages; [
      JSONStream_1-3-4
      lodash_4-17-11
      split2_2-2-0
      through2_2-0-3
      trim-off-newlines_1-0-1
      meow_3-7-0
      is-text-path_1-0-1
    ];
    meta = {
      homepage = "https://github.com/conventional-changelog/conventional-commits-parser";
      description = "Parse raw conventional commits";
      keywords = [
        "conventional-commits-parser"
        "changelog"
        "conventional"
        "parser"
        "parsing"
        "logs"
      ];
    };
  }
