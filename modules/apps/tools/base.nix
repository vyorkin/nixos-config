{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    binutils
    coreutils
    pciutils
    usbutils
    elfutils
    patchelf
    util-linux
    bat
    screenfetch
    tree
  ];
}
