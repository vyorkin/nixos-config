{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    screenfetch
    tree
  ];
}
