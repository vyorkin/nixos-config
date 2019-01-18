{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchgit {
    url = "https://github.com/vyorkin-forks/easy-purescript-nix.git";
    rev = "7aa5918d977a5d3a02c2628ca8cfbb0374e52dae";
    sha256 = "0973vbq2ia5z9mx8i0nb5y0n3xylfljnjfyhp9pn8265irf5f3w2";
  });
in
  { environment.systemPackages = easy-purescript.buildInputs;
  }
