{ pkgs, ... }:

let
  packageSet = pkgs.haskell.packages.ghc882;
  haskellPackages = pkgs.callPackage ./packages { inherit packageSet; };
in {
  imports = [./base.nix];

  environment.systemPackages = haskellPackages;

  services.hoogle = {
    enable = false;
    port = 9000;

    haskellPackages = packageSet;
  };
}
