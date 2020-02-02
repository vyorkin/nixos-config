{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xlibs.xev
    xlibs.xprop
    xwayland
    xorg.xinput
    xorg.xset
    xorg.xsetroot
    xorg.xkbutils
    xorg.xkbcomp
    xorg.setxkbmap
    xorg.xmodmap
    xorg.xhost
    xorg.xmessage
    xorg.xgamma
    xorg.xrandr
    xorg.xmag
    xrandr-invert-colors
    arandr
    autorandr
    xbindkeys
    xbindkeys-config
    xidlehook
    xautolock
    xcape
    xclip
    xcalib
    nitrogen
    (dunst.override { dunstify = true; })
    dmenu
    clipmenu
    rofi
    compton
    libnotify
    dzen2
  ];
}