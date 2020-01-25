{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ranger
    nnn
    broot
  ];
}
