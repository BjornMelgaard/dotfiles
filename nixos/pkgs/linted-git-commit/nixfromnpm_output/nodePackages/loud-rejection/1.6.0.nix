{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "loud-rejection";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/loud-rejection/-/loud-rejection-1.6.0.tgz";
      sha1 = "5b46f80147edee578870f086d04821cf998e551f";
    };
    deps = with nodePackages; [
      currently-unhandled_0-4-1
      signal-exit_3-0-2
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/loud-rejection#readme";
      description = "Make unhandled promise rejections fail loudly instead of the default silent fail";
      keywords = [
        "promise"
        "promises"
        "unhandled"
        "uncaught"
        "rejection"
        "loud"
        "fail"
        "catch"
        "throw"
        "handler"
        "exit"
        "debug"
        "debugging"
        "verbose"
      ];
    };
  }
