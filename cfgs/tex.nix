{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    auctex
    rubber
    texmaker
    texstudio

    texlive.combined.scheme-full
  ];
}
