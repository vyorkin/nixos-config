{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    xcape
    xsel

    arandr
    autorandr
  ];
}
