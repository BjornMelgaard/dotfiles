{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "cardinal";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/cardinal/-/cardinal-1.0.0.tgz";
      sha1 = "50e21c1b0aa37729f9377def196b5a9cec932ee9";
    };
    deps = with nodePackages; [
      ansicolors_0-2-1
      redeyed_1-0-1
    ];
    meta = {
      homepage = "https://github.com/thlorenz/cardinal#readme";
      description = "Syntax highlights JavaScript code with ANSI colors to be printed to the terminal.";
      keywords = [
        "syntax"
        "highlight"
        "theme"
        "javascript"
        "json"
        "terminal"
        "console"
        "print"
        "output"
      ];
    };
  }
