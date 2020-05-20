{ pkgs, ... }:

{
  services.udev.packages = [pkgs.android-udev-rules];
  programs.adb.enable = true;
}
