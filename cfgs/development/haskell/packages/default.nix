{ pkgs, packageSet, ... }:

let
  ormolu = (import (builtins.fetchGit {
    url = "https://github.com/tweag/ormolu";
    rev = "55d8b7f8c482655ea575425e55352e650f304ea0";
  }) { }).ormolu;

  # liquid = packageSet.callPackage ./liquidhaskell-0.8.6.0.nix { };
  # brittany = packageSet.callPackage ./brittany-0.12.0.0.nix { };

in with packageSet; [
  ormolu

  # summoner

  hpack
  alex
  happy

  # dhall
  # dhall-json
  # expresso

  # liquidhaskell

  # cabal-bounds

  doctest

  # threadscope

  # hkgr
  json-autotype
  styx
  # intero

  # brittany

  hoogle
  # hindent
  stylish-haskell
  hlint

  # ctags file generator for cabal/stack project dependencies
  # codex

  hasktags
  haskdogs

  # lambdabot

  # apply-refact
  # present
  weeder
  ghcid
  cpphs
  suspend
  dotgen
  fast-tags

  pretty-simple
  pretty-show
  # ghci-pretty

  # pointfree

  # Agda

  # ats-pkg
  # ats-format
]
