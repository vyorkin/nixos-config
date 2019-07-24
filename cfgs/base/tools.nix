{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree
    parted
    binutils
    gcc
    gnumake
    openssl
    m4

    telnet

    screenfetch
    bat
    exa
    ncdu
  ];
}
