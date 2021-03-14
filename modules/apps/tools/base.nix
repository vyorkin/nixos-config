{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    binutils
    coreutils
    pciutils
    usbutils
    elfutils
    patchelf
    bat
    screenfetch
    tree
  ];
}
