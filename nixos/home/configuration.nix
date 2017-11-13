# This is the user configuration file,
# use it with https://github.com/rycee/home-manager
#
# import it in your `$HOME/.config/nixpkgs/configuration.nix` like this:
# ```
# let
#   dotfilesDir=/home/bjorn/.config/dotfiles;
# in
#   import "${dotfilesDir}/nixos/home/configuration.nix"
# ```

{ config, pkgs, ... }:

{
  packageOverrides = pkgs : with pkgs; {
    rvmEnv = pkgs.myEnvFun {
      name = "rvm";
      buildInputs = [ stdenv which readline zlib openssl libxml2 libxslt libiconv ];
      extraCmds = ''
        unset http_proxy
        unset ftp_proxy
        export LIBXML2_DIR=${libxml2}
        export LIBXSLT_DIR=${libxslt}
        export LIBICONV_DIR=${libiconv}
        export OPENSSL_DIR=${openssl}
        export READLINE_DIR=${readline}
        bash --login
        rvm use ruby
      '';
    };
  };
}
