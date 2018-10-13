{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "strip-bom";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/strip-bom/-/strip-bom-2.0.0.tgz";
      sha1 = "6219a85616520491f35788bdbf1447a99c7e6b0e";
    };
    deps = with nodePackages; [
      is-utf8_0-2-1
    ];
    meta = {
      homepage = "https://github.com/sindresorhus/strip-bom";
      description = "Strip UTF-8 byte order mark (BOM) from a string/buffer";
      keywords = [
        "bom"
        "strip"
        "byte"
        "mark"
        "unicode"
        "utf8"
        "utf-8"
        "remove"
        "delete"
        "trim"
        "text"
        "buffer"
        "string"
      ];
    };
  }
