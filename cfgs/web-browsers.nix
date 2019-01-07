{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium

    firefox
    shadowfox

    lynx
    w3m
  ];
}
