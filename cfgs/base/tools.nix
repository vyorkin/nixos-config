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
    libedit
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
    screen
  ];
}
