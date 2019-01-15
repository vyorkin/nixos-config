{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    # at this git revision:
    rev = "d8191950b2065625eb07839efa6f4bfb95769e6c";
    # this sha can be obtained by using
    # nix-prefetch-git justinwoo easy-purescript-nix
    sha256 = "1l3a46rqcd4n9rpxb2cfw52jimsmfxikkq20a2rpkjycm69la45w";
  });
in
  { environment.systemPackages = easy-purescript.buildInputs;
  }
