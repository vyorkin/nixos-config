{ pkgs, packageSet, ... }:

let
  # 0.8.6.2: missing or private dependencies: Diff ==0.3.*
  # 0.8.6.0: Not in scope: data constructor ‘TvBndr’
  # liquid = packageSet.callPackage ./liquidhaskell-0.8.6.0.nix { };
in with packageSet; [
  hpack
  alex
  happy

  dhall
  dhall-json
  expresso

  doctest

  threadscope

  # hkgr
  json-autotype
  styx
  # intero

  brittany

  hoogle

  # hindent

  # Fresh fork of hindent
  # floskell

  stylish-haskell
  hlint
  codex
  hasktags
  haskdogs
  apply-refact
  # present
  weeder
  ghcid
  cpphs
  suspend
  dotgen
  fast-tags

  pretty-simple
  pretty-show

  # ATS

  ats-pkg
  hs2ats

  # Broken

  # summoner
  # liquid
  # ghci-pretty
  # pointfree

  # c2ats
  # ats-format
]
