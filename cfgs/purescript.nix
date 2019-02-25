{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchgit {
    url = "https://github.com/justinwoo/easy-purescript-nix.git";
    rev = "0debbe629de2c2d6278ba772e40a0851a57b9d2f";
    sha256 = "1k83gsfgg4p4c2f6ls467fm8v1ixmy1y3jly8id5wc71zc7szs1q";
  });
in
  { environment.systemPackages = easy-purescript.buildInputs;
  }
