{ buildNodePackage, fetchUrlNamespaced, namespaceTokens, nodePackages, pkgs }:
buildNodePackage {
    name = "sander";
    version = "0.6.1";
    src = fetchUrlNamespaced {
      url = "https://registry.npmjs.org/@marionebl/sander/-/sander-0.6.1.tgz";
      sha1 = "1958965874f24bc51be48875feb50d642fc41f7b";
      namespace = "marionebl";
    };
    namespace = "marionebl";
    deps = with nodePackages; [
      mkdirp_0-5-1
      rimraf_2-6-2
      graceful-fs_4-1-11
    ];
    meta = {
      homepage = "https://github.com/rich-harris/sander#readme";
      description = "Promise-based power tool for common filesystem tasks";
    };
  }
