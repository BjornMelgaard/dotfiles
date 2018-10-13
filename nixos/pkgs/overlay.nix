pkgs: pkgsOld:
{
  # nixfmt                = pkgs.haskellPackages.callPackage ../../pkgs/nixfmt {};
  # nix-lsp               = pkgs.callPackage ../../pkgs/nix-lsp {};

  dunsted-volume        = pkgs.callPackage ./dunsted-volume {};
  kb-light              = pkgs.callPackage ./kb-light {};
  randomize_background  = pkgs.callPackage ./randomize_background {};
  switch_touchpad       = pkgs.callPackage ./switch_touchpad {};
  tmuxx                 = pkgs.callPackage ./tmuxx {};
  umsf                  = pkgs.callPackage ./umsf {};
  cachix                = pkgs.callPackage ./cachix {};
  fix_github_https_repo = pkgs.callPackage ./fix_github_https_repo {};
  hubstaff              = pkgs.callPackage ./hubstaff {};
}
