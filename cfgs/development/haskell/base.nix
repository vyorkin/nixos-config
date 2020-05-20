{ pkgs, inputs, ... }:

let
  # TODO: Wait for 8.8.3 support: https://github.com/Infinisil/all-hies/issues/55
  # all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") { };

  # stable HIE for GHC versions 8.8.3 if available and fall back to unstable otherwise
  # hie = all-hies.unstableFallback.selection { selector = p: { inherit (p) ghc883; }; };
  # ghcide883 = (import (builtins.fetchTarball "https://github.com/gdeest/ghcide-nix/tarball/06906f0e3c1172f02d1fee8ae73cae247d8d9433") {}).ghcide-ghc883;

  # nix-tools = with (import inputs.nixpkgs (import (builtins.fetchTarball https://github.com/input-output-hk/haskell.nix/archive/master.tar.gz) {}).nixpkgsArgs); haskell-nix.nix-tools;
in
{
  environment.systemPackages = with pkgs; [
    cabal-install

    pkgs.haskell.compiler.ghc883
    # ghcide883

    stack
    # hie

    # nix-tools

    # ATS

    pkgs.haskellPackages.ats-pkg
    pkgs.haskellPackages.hs2ats
    # pkgs.haskellPackages.ats-format
    # pkgs.haskellPackages.c2ats
  ];
}
