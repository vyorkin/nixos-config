{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    binutils
    coreutils
    pciutils
    usbutils
    bat
    screenfetch
    tree
  ];
}
