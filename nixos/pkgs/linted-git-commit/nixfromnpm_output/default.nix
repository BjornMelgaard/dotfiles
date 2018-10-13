{ nodejs ? pkgs.nodejs-8_x, pkgs ? import <nixpkgs> {} }:
let
    mkNodeLib = import ./nodeLib {
      self = mkNodeLib;
    };
    nodeLib = mkNodeLib {
      inherit pkgs nodejs;
    };
    in nodeLib.generatePackages {
      nodePackagesPath = ./nodePackages;
    }
