{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bc
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

    graphviz
    zgrviewer

    extundelete

    xflux
    xflux-gui
    blugon

    xmagnify
    slop

    # Google Drive
    insync
    drive
    gdrive
  ];
}
