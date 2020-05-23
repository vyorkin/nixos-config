{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lxappearance-gtk3

    # arc-theme
    # paper-gtk-theme
    # paper-icon-theme
    # numix-gtk-theme
    # numix-icon-theme
    # numix-cursor-theme
    # shades-of-gray-theme
    # adapta-gtk-theme
  ];
}
