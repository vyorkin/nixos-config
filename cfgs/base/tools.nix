{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree
    parted
    binutils
    gcc
    gnumake
    openssl

    telnet

    screenfetch
    bat
    exa
    ncdu
  ];
}
