{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "JSONStream";
    version = "1.3.4";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/JSONStream/-/JSONStream-1.3.4.tgz";
      sha1 = "615bb2adb0cd34c8f4c447b5f6512fa1d8f16a2e";
    };
    deps = with nodePackages; [
      jsonparse_1-3-1
      through_2-3-8
    ];
    meta = {
      homepage = "http://github.com/dominictarr/JSONStream";
      description = "rawStream.pipe(JSONStream.parse()).pipe(streamOfObjects)";
      keywords = [
        "json"
        "stream"
        "streaming"
        "parser"
        "async"
        "parsing"
      ];
    };
  }
