{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cabal2nix
    cabal-install
    stack
  ];
}
