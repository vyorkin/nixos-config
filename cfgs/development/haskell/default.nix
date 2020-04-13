{ pkgs, ... }:

let
  packageSet = pkgs.haskell.packages.ghc882;
  haskellPackages = pkgs.callPackage ./packages { inherit packageSet; };
in
  {
    imports = [./base.nix];

    environment.systemPackages = haskellPackages;

    services.hoogle = {
      enable = true;
      port = 9000;

      packages = (hpkgs: with hpkgs; [
      relude
      text
      utf8-string
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

      alex
      happy

      # co-log
      cryptonite
      memory
      http-client
      http-client-tls
      http-api-data
      # servant
      # servant-client
      aeson
      aeson-pretty
      network
      # (req.overrideAttrs (old: { doCheck = false; }))
      websockets
      optparse-applicative

      # parsec
      # megaparsec
      # parser-combinators

      # OpenGL
      # GLUT
      # gloss
      # gloss-juicy
      # apecs
      # apecs-gloss

      # hasbolt
      # hasbolt-extras

      # capability

      Glob
      filepath
      brick
      vty

      # (dhall.overrideAttrs (old: { doCheck = false; }))

      hspec
      tasty
      tasty-hedgehog
      tasty-hspec
      QuickCheck
      hedgehog
      # doctest

      suspend
      timers

      monad-logger
      # persistent
      # persistent-postgresql

      (dotenv.overrideAttrs (old: { doCheck = false; }))

      # sum-type-boilerplate
      # eventful-core
      # eventful-memory
      # (eventful-postgresql.overrideAttrs (old: { doCheck = false; }))
      # eventful-test-helpers

      # TODO: base 4.13.0.0 is not on hackage
      # llvm-hs
      # llvm-hs-pretty

      # autoexporter

      # pointfree
      # pointful
      ]);

      haskellPackages = packageSet;
    };
  }
