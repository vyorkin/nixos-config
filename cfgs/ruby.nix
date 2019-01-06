{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bundix
  ];
}
