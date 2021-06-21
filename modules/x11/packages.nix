{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    xcape
    arandr
    autorandr
  ];
}
