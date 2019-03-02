{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    scrot
    flameshot
    aria2
    urlscan
    urlview
    urlwatch
    file
  ];
}
