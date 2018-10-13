{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "readable-stream";
    version = "2.3.6";
    src = pkgs.fetchurl {
      url = "http://registry.npmjs.org/readable-stream/-/readable-stream-2.3.6.tgz";
      sha1 = "b11c27d88b8ff1fbe070643cf94b0c79ae1b0aaf";
    };
    deps = with nodePackages; [
      string_decoder_1-1-1
      inherits_2-0-3
      isarray_1-0-0
      safe-buffer_5-1-2
      util-deprecate_1-0-2
      core-util-is_1-0-2
      process-nextick-args_2-0-0
    ];
    meta = {
      homepage = "https://github.com/nodejs/readable-stream#readme";
      description = "Streams3, a user-land copy of the stream library from Node.js";
      keywords = [
        "readable"
        "stream"
        "pipe"
      ];
    };
  }
