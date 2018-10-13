{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "get-stream";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/get-stream/-/get-stream-3.0.0.tgz";
      sha1 = "8e943d1358dc37555054ecbe2edb05aa174ede14";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/sindresorhus/get-stream#readme";
      description = "Get a stream as a string, buffer, or array";
      keywords = [
        "get"
        "stream"
        "promise"
        "concat"
        "string"
        "str"
        "text"
        "buffer"
        "read"
        "data"
        "consume"
        "readable"
        "readablestream"
        "array"
        "object"
        "obj"
      ];
    };
  }
