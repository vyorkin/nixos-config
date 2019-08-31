{ pkgs, ... }:

let
  packageSet = pkgs.haskell.packages.ghc865;
  haskellPackages = pkgs.callPackage ./packages { inherit packageSet; };
in
  {
    imports = [./base.nix];

    environment.systemPackages = haskellPackages;

    services.hoogle = {
      enable = true;
      packages = (hpkgs: with hpkgs; [
      relude
      text
      array
      time
      bytestring
      containers
      parallel
      monad-par
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
      parser-combinators

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

      (dhall.overrideAttrs (old: { doCheck = false; }))

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

      haskellPackages = packageSet;
    };
  }
