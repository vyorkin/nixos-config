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
    numactl
    nix-index

    fwts
    lshw

    telnet

    screenfetch
    bat
    exa
    fd
    prettyping
    ncdu

    earlyoom
  ];
}
