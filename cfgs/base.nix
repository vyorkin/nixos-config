{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgconfig
    nix-prefetch-scripts
    parted
    binutils
    gcc
    gnumake
    openssl

    telnet

    bat
    ncdu

    xorg.xinput
    xorg.xset
    xorg.setxkbmap
    xorg.xmodmap
    xcape
    xclip
  ];
}
