{ pkgs, packageSet, ... }:

let
  ormoluPkg = import (builtins.fetchGit {
    url = "https://github.com/tweag/ormolu";
    rev = "bdc8738fa89d37ca330221d8b75427f466f9e08a";
  });

  liquid = packageSet.callPackage ./liquidhaskell.nix { };
  brittany = packageSet.callPackage ./brittany.nix { };

in with packageSet; [
  ormoluPkg.ormolu

  hpack
  happy

  dhall
  dhall-json
  expresso

  liquid

  doctest

  # threadscope

  # hkgr
  json-autotype
  styx
  # intero

  brittany

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

  ats-pkg
  # ats-format
]
