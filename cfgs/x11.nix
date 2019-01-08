{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xlibs.xev
    xlibs.xprop
    xorg.xinput
    xorg.xset
    xorg.setxkbmap
    xorg.xmodmap
    xorg.xhost
    xorg.xmessage
    xcape
    xclip
  ];
}
