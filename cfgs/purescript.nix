{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchgit {
    url = "https://github.com/justinwoo/easy-purescript-nix.git";
    rev = "0b2c378b360ca0ff92e3fe3a41d191457036b4d6";
    sha256 = "0q3z494wizbhyz3ifr8kvbcjmi4220nbzksgkhn58300vqiqpa6z";
  });
in
  { environment.systemPackages = easy-purescript.buildInputs;
  }
