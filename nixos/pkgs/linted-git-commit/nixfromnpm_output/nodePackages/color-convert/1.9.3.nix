{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "color-convert";
    version = "1.9.3";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz";
      sha1 = "bb71850690e1f136567de629d2d5471deda4c1e8";
    };
    deps = with nodePackages; [
      color-name_1-1-3
    ];
    meta = {
      homepage = "https://github.com/Qix-/color-convert#readme";
      description = "Plain color conversion functions";
      keywords = [
        "color"
        "colour"
        "convert"
        "converter"
        "conversion"
        "rgb"
        "hsl"
        "hsv"
        "hwb"
        "cmyk"
        "ansi"
        "ansi16"
      ];
    };
  }
