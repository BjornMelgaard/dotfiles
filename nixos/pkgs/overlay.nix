pkgs: pkgsOld:
{
  mypkgs = {
    all-hies              = pkgs.callPackage ./all-hies {};
    arion                 = pkgs.callPackage ./arion {};
    auto-hie-wrapper      = pkgs.callPackage ./auto-hie-wrapper {};
    cachix                = pkgs.callPackage ./cachix {};
    dropbox-cli           = pkgs.callPackage ./dropbox-cli {};
    dunsted-volume        = pkgs.callPackage ./dunsted-volume {};
    fix-github-https-repo = pkgs.callPackage ./fix-github-https-repo {};
    hubstaff              = pkgs.callPackage ./hubstaff {};
    kb-light              = pkgs.callPackage ./kb-light {};
    linted-git-commit     = pkgs.callPackage ./linted-git-commit {};
    nix-lsp               = pkgs.callPackage ../../pkgs/nix-lsp {};
    nixfmt                = pkgs.haskellPackages.callPackage ../../pkgs/nixfmt {};
    nixfromnpm            = pkgs.callPackage ./nixfromnpm {};
    obelisk               = pkgs.libsForQt5.callPackage ./obelisk {};
    pgFormatter           = pkgs.callPackage ./pgFormatter {};
    pgmodeler             = pkgs.libsForQt5.callPackage ./pgmodeler {};
    randomize_background  = pkgs.callPackage ./randomize_background {};
    switch_touchpad       = pkgs.callPackage ./switch_touchpad {};
    tmuxx                 = pkgs.callPackage ./tmuxx {};
    umsf                  = pkgs.callPackage ./umsf {};
    yed                   = pkgs.callPackage ./yed {};
  };
}
