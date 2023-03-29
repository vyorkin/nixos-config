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
    # khal
    screenfetch
    tree
    dig
  ];
}
