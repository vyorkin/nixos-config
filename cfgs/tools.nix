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

    extundelete

    xflux
    xflux-gui

    xmagnify
    slop

    # Google Drive
    insync
    drive
    gdrive
  ];
}
