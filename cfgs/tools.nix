{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bbe
    scrot
    flameshot
    aria2
    urlscan
    urlview
    urlwatch
    file
    pmutils
    usbutils
  ];
}
