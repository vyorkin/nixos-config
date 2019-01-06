{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabal2nix
    cabal-install
    stack
  ];
}
