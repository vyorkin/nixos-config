{ pkgs, inputs, ... }:

let
  compiler = "ghc883";
  packageSet = pkgs.haskell.packages."${compiler}";
  haskellPackages = pkgs.callPackage ./packages { inherit packageSet; };

  addExtraLibrary = pkgs.haskell.lib.addExtraLibrary;
in {
  imports = [ ./base.nix ];

  environment.systemPackages = haskellPackages;

  # Enable local documentation server
  services.hoogle = {
    enable = true;
    port = 9000;

    # Fix the URL for Hoogle logo
    home = "https://localhost:9000";

    # The Haskell packages to generate documentation for
    packages = (hpkgs:
      with hpkgs; [
        relude
        text
        array
        time
        bytestring
        utf8-string
        containers
        parallel
        monad-par
        stm
        mtl
        natural-transformation
        mmorph
        lens
        microlens
        unliftio
        unliftio-core
        async
        vector
        unordered-containers
        rio
        rio-orphans
        lifted-async
        exceptions
        safe-exceptions
        errors
        resourcet
        resource-pool
        turtle

        contravariant
        invariant

        process
        typed-process
        repline

        llvm-hs-pure
        llvm-hs
        llvm-hs-pretty

        data-default-class
        data-default

        alex
        happy

        co-log
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
        prettyprinter
        prettyprinter-ansi-terminal

        parsec
        megaparsec
        parser-combinators

        OpenGL
        GLUT
        gloss
        gloss-juicy
        apecs
        apecs-gloss

        sdl2
        sdl2-image
        sdl2-ttf
        sdl2-mixer
        sdl2-gfx
        sdl2-sprite

        vulkan
        vulkan-api
        (addExtraLibrary VulkanMemoryAllocator pkgs.vulkan-headers)

        linear

        # hasbolt
        # hasbolt-extras

        capability
        polysemy
        fused-effects
        freer-simple

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

        # autoexporter

        # pointfree
        # pointful
      ]);

    haskellPackages = packageSet;
  };
}
