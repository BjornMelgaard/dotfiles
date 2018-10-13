{ buildNodePackage, nodePackages, pkgs }:
buildNodePackage {
    name = "compare-func";
    version = "1.3.2";
    src = pkgs.fetchurl {
      url = "https://registry.npmjs.org/compare-func/-/compare-func-1.3.2.tgz";
      sha1 = "99dd0ba457e1f9bc722b12c08ec33eeab31fa648";
    };
    deps = with nodePackages; [
      dot-prop_3-0-0
      array-ify_1-0-0
    ];
    meta = {
      homepage = "https://github.com/stevemao/compare-func";
      description = "Get a compare function for array to sort";
      keywords = [
        "compare-func"
        "arr"
        "array"
        "by"
        "compare"
        "dot"
        "get"
        "obj"
        "object"
        "prop"
        "property"
        "sort"
        "sorting"
      ];
    };
  }
