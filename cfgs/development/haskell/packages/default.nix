{ pkgs, packageSet, ... }:

with packageSet; [
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
  codex
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
