pkgs: pkgsOld:
{
  nixfmt                = pkgs.haskellPackages.callPackage ../../pkgs/nixfmt {};
  nix-lsp               = pkgs.callPackage ../../pkgs/nix-lsp {};
  dunsted-volume        = pkgs.callPackage ./dunsted-volume {};
  kb-light              = pkgs.callPackage ./kb-light {};
  randomize_background  = pkgs.callPackage ./randomize_background {};
  switch_touchpad       = pkgs.callPackage ./switch_touchpad {};
  tmuxx                 = pkgs.callPackage ./tmuxx {};
  umsf                  = pkgs.callPackage ./umsf {};
  cachix                = pkgs.callPackage ./cachix {};
  fix-github-https-repo = pkgs.callPackage ./fix-github-https-repo {};
  hubstaff              = pkgs.callPackage ./hubstaff {};
  nixfromnpm            = pkgs.callPackage ./nixfromnpm {};
  linted-git-commit     = pkgs.callPackage ./linted-git-commit {};
  all-hies              = pkgs.callPackage ./all-hies {};
  auto-hie-wrapper      = pkgs.callPackage ./auto-hie-wrapper {};
  yed                   = pkgs.callPackage ./yed {};
  pgFormatter           = pkgs.callPackage ./pgFormatter {};
  arion                 = pkgs.callPackage ./arion {};
  pgmodeler             = pkgs.libsForQt5.callPackage ./pgmodeler {};
  obelisk               = pkgs.libsForQt5.callPackage ./obelisk {};
}
