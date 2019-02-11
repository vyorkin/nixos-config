{ pkgs, ... }:

let
  # import the remote nix expression
  easy-purescript = import (pkgs.fetchgit {
    url = "https://github.com/vyorkin-forks/easy-purescript-nix.git";
    rev = "aa72f20d00c5e7f29be44090398acd84acb71ea7";
    sha256 = "12cg2krwq1qq9dxijjczkvia36jrgjzm302r67wxqf9dishsxgrm";
  });
in
  { environment.systemPackages = easy-purescript.buildInputs;
  }
