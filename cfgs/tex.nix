{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    auctex
    rubber
    texlive.combined.scheme-full
    texmaker
    texstudio
  ];
}
