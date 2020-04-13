{ pkgs, ... }:

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") { };

  # stable HIE for GHC versions 8.8.2 if available and fall back to unstable otherwise
  hie = all-hies.unstableFallback.selection { selector = p: { inherit (p) ghc882; }; };
  ghcide882 = (import (builtins.fetchTarball "https://github.com/gdeest/ghcide-nix/tarball/06906f0e3c1172f02d1fee8ae73cae247d8d9433") {}).ghcide-ghc882;

  # haskell.nix by HKIO
  # see:
  # https://github.com/input-output-hk/haskell.nix/issues/430
  # https://github.com/input-output-hk/haskell.nix/issues/99#issuecomment-570908652
  # https://github.com/input-output-hk/haskell.nix/issues/287
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

    # ghcide882

    # hio.haskell-nix.nix-tools
  ];
}
