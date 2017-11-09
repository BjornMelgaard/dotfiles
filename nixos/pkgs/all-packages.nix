{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = super: {
    dunsted-volume = pkgs.callPackage ./dunsted-volume {};
  };
}
