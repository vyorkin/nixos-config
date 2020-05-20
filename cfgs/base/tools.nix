{ pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.0.2u"
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

    ntfs3g

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
