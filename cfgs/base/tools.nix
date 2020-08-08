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
    pkg-config
    openssl
    openssl.dev
    m4
    numactl
    libedit
    nix-index

    ntfs3g

    fwts
    lshw
    pciutils

    telnet

    screenfetch
    bat
    exa
    fd
    prettyping
    ncdu
    rlwrap

    earlyoom
    screen
  ];
}
