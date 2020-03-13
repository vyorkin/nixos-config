{ pkgs, ... }:

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") { };
  # stable HIE for GHC versions 8.8.2 if available and fall back to unstable otherwise
  hie = all-hies.unstableFallback.selection { selector = p: { inherit (p) ghc882; }; };
  # haskell.nix by HKIO
  # hio = (import <nixpkgs> (import (builtins.fetchTarball https://github.com/input-output-hk/haskell.nix/archive/master.tar.gz)));
in
{
  environment.systemPackages = with pkgs; [
    cabal-install

    # Default GHC version is 8.6.5
    # ghc

    pkgs.haskell.compiler.ghc882

    stack
    hie

    # hio.haskell-nix.nix-tools
  ];
}
