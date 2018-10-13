{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "npm-run-path";
    version = "2.0.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/npm-run-path/-/npm-run-path-2.0.2.tgz";
      sha1 = "35a9232dfa35d7067b4cb2ddf2357b1871536c5f";
    };
    deps = with nodePackages; [
      path-key_2-0-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/npm-run-path#readme";
      description = "Get your PATH prepended with locally installed binaries";
      keywords = [
        "npm"
        "run"
        "path"
        "package"
        "bin"
        "binary"
        "binaries"
        "script"
        "cli"
        "command-line"
        "execute"
        "executable"
      ];
    };
  }
