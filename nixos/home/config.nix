with (import /etc/nixos/metaconfiguration.nix);

{ pkgs, ... }:

{
  allowUnfree = true;

  packageOverrides = pkgs : with pkgs; {

    # TODO: impure python env
    # pythonEnv = with pkgs; buildEnv {
    #   name = "pythonEnv";
    #   paths = [
    #     (with python36Packages; python.buildEnv.override {
    #         extraLibs = [
    #           setuptools
    #           jedi
    #           flake8
    #           numpy
    #           isort
    #           yapf
    #           pytest
    #         ];
    #     })
    #   ];
    # };

    # # \curl -L https://get.rvm.io | bash -s stable --rails --auto-dotfiles
    # # gem install bundle
    # # gem install pg
    # # gem install nokogiri -- --use-system-libraries
    # # bundle config build.nokogiri --use-system-libraries
    # # bundle install

    # rvmEnv = pkgs.myEnvFun {
    #   name = "rvm";
    #   buildInputs = [ stdenv pkgconfig python pythonPackages.boto procps which libyaml readline zlib openssl libxml2 libxslt libiconv postgresql curl ];
    #   extraCmds = ''
    #     unset http_proxy
    #     unset ftp_proxy

    #     # fix curl
    #     export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt

    #     # start postgresql
    #     export PGDATA=~/.mytmp/pgdata
    #     # initdb
    #     # pg_ctl start
    #     # createdb nuuz_dev

    #     export LIBXML2_DIR=${libxml2}
    #     export LIBXSLT_DIR=${libxslt}
    #     export LIBICONV_DIR=${libiconv}
    #     export OPENSSL_DIR=${openssl}
    #     export READLINE_DIR=${readline}
    #     export LIBYAML_DIR=${libyaml}
    #     export LOCAL_REDIS=true
    #     . ~/.rvm/scripts/rvm
    #   '';
    # };

  };
}
