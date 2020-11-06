{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bc
    bbe
    scrot
    # Linux screen capture using pygtk, inspired by scrot
    escrotum

    flameshot
    peek

    tldr
    cheat

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

    _1password
    # google-authenticator
    # _1password-gui
    # sudolikeaboss

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
