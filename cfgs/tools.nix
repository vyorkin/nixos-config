{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bc
    bbe
    scrot

    flameshot
    peek

    aria2
    urlscan
    urlview
    urlwatch
    html2text
    file
    pmutils
    usbutils
    up
    mdcat

    graphviz
    zgrviewer

    extundelete

    stress
    ksysguard
    cpufrequtils
    linuxPackages.cpupower


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
