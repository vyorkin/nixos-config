{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rubber
    texlive.combined.scheme-full
    texmaker
    texstudio
  ];
}
