{ pkgs, ... }:

let
  pkgSet = pkgs.haskell.packages.ghc865;
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
  # stable HIE for GHC versions 8.6.5 if available and fall back to unstable otherwise
  hies = all-hies.unstableFallback.selection { selector = p: { inherit (p) ghc865; }; };
  haskellPkgs = with pkgSet; [
    hpack
    happy

    dhall
    dhall-json

    doctest

    styx
    # intero
    # brittany
    hoogle
    hindent
    stylish-haskell
    hlint
    hasktags
    haskdogs
    apply-refact
    present
    alex
    weeder
    ghcid
    cpphs
    dotgen
    fast-tags

    pretty-simple
    pretty-show
    ghci-pretty

    pointfree

    Agda
  ];
in
{
  environment.systemPackages = with pkgs; [
    cabal-install
    cabal2nix
    ghc
    stack
    hies
  ] ++ haskellPkgs;

  services.hoogle = {
    enable = true;
    packages = (hpkgs: with hpkgs; [
      relude
      text
      time
      bytestring
      containers
      stm
      mtl
      natural-transformation
      lens
      unliftio
      unliftio-core
      async
      lifted-async
      exceptions
      safe-exceptions
      errors
      resource-pool
      turtle

      data-default-class
      data-default

      # co-log
      cryptonite
      memory
      http-client
      http-client-tls
      http-api-data
      servant
      servant-client
      aeson
      aeson-pretty
      network
      (req.overrideAttrs (old: { doCheck = false; }))
      websockets
      optparse-applicative

      parsec
      megaparsec

      OpenGL
      GLUT
      gloss

      hasbolt
      hasbolt-extras

      capability

      Glob
      filepath
      brick
      vty

      dhall

      hspec
      tasty
      tasty-hedgehog
      tasty-hspec
      QuickCheck
      hedgehog
      doctest

      suspend
      timers

      monad-logger
      persistent
      persistent-postgresql

      (dotenv.overrideAttrs (old: { doCheck = false; }))

      sum-type-boilerplate
      eventful-core
      eventful-memory
      (eventful-postgresql.overrideAttrs (old: { doCheck = false; }))
      eventful-test-helpers

      pointfree
      # pointful
    ]);
    haskellPackages = pkgSet;
  };
}
