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
    html2text
    file
    pmutils
    usbutils
    up

    xflux
    xflux-gui
  ];
}
