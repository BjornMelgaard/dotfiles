{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "isexe";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
      sha1 = "e8fbf374dc556ff8947a10dcb0572d633f2cfa10";
    };
    deps = [];
    meta = {
      homepage = "https://github.com/isaacs/isexe#readme";
      description = "Minimal module to check if a file is executable.";
    };
  }
