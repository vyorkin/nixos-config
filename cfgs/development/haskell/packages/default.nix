{ pkgs, packageSet, ... }:

let
  ormoluPkg = import (builtins.fetchGit {
    url = "https://github.com/tweag/ormolu";
    rev = "55d8b7f8c482655ea575425e55352e650f304ea0";
  }) { };

  # liquid = packageSet.callPackage ./liquidhaskell-0.8.6.0.nix { };
  # brittany = packageSet.callPackage ./brittany-0.12.0.0.nix { };

in with packageSet; [
  ormoluPkg.ormolu

  # summoner

  hpack
  alex
  happy

  # dhall
  # dhall-json
  # expresso

  # liquidhaskell

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
  hasktags
  haskdogs
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
