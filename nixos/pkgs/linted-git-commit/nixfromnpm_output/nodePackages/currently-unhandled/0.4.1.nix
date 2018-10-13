{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "currently-unhandled";
    version = "0.4.1";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/currently-unhandled/-/currently-unhandled-0.4.1.tgz";
      sha1 = "988df33feab191ef799a61369dd76c17adf957ea";
    };
    deps = with nodePackages; [
      array-find-index_1-0-2
    ];
    meta = {
      homepage = "https://github.com/jamestalmage/currently-unhandled#readme";
      description = "Track the list of currently unhandled promise rejections.";
      keywords = [
        "unhandled"
        "unhandledRejection"
        "rejected"
        "promises"
      ];
    };
  }
