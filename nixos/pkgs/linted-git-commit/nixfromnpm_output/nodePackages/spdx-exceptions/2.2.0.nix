{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "spdx-exceptions";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/spdx-exceptions/-/spdx-exceptions-2.2.0.tgz";
      sha1 = "2ea450aee74f2a89bfb94519c07fcd6f41322977";
    };
    deps = [];
    devDependencies = [];
    meta = {
      homepage = "https://github.com/kemitchell/spdx-exceptions.json#readme";
      description = "list of SPDX standard license exceptions";
    };
  }
