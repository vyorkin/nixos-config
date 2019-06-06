{ pkgs, ... }:

let
  packageSet = pkgs.haskell.packages.ghc865;
  haskellPackages = import ./packages.nix { inherit packageSet; };
in
  with import ./hoogle.nix { inherit packageSet; };
  {
    imports = [./base.nix];
    environment.systemPackages = haskellPackages;
  }
