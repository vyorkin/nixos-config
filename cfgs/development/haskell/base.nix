{ pkgs, ... }:

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") { };
  # stable HIE for GHC versions 8.6.5 if available and fall back to unstable otherwise
  hie = all-hies.unstableFallback.selection { selector = p: { inherit (p) ghc865; }; };
in
{
  environment.systemPackages = with pkgs; [
    cabal-install
    ghc
    stack
    hie
  ];
}
