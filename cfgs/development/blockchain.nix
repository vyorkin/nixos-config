{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    solc
    slither-analyzer
  ];
}
