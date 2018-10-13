{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "signal-exit";
    version = "3.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.2.tgz";
      sha1 = "b5fdc08f1287ea1178628e415e25132b73646c6d";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/tapjs/signal-exit";
      description = "when you want to fire an event no matter how a process exits.";
      keywords = [ "signal" "exit" ];
    };
  }
