{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "is-stream";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/is-stream/-/is-stream-1.1.0.tgz";
      sha1 = "12d4a3dd4e68e0b79ceb8dbc84173ae80d91ca44";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/is-stream#readme";
      description = "Check if something is a Node.js stream";
      keywords = [
        "stream"
        "type"
        "streams"
        "writable"
        "readable"
        "duplex"
        "transform"
        "check"
        "detect"
        "is"
      ];
    };
  }
