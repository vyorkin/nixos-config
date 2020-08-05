{ pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.0.2u"
    "p7zip-16.02"
  ];

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
