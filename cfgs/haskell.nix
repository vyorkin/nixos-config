{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabal-install
    cabal2nix
    ghc
    # stack
  ];

  services.hoogle = {
    enable = true;
    packages = (hpkgs: with hpkgs; [
      relude
      text
      time
      bytestring
      containers
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
      co-log
      cryptonite
      http-client
      http-client-tls
      http-api-data
      servant
      servant-client
      aeson
      network
      wreq
      websockets
      optparse-applicative
      parsec
      megaparsec

      OpenGL
      GLUT
      gloss

      hspec
      tasty
      tasty-hspec
      QuickCheck
      hedgehog

      eventful-core
      # eventful-memory
      # eventful-postgresql
      # eventful-test-helpers

      pointfree
      # pointful
    ]);
    haskellPackages = pkgs.haskellPackages;
  };
}
