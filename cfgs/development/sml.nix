{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # smlnjBootstrap
    smlnj
    mosml
    mlton
  ];
}
