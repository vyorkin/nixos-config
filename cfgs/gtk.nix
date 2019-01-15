{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lxappearance-gtk3
    numix-gtk-theme
    numix-icon-theme
    numix-cursor-theme
  ];
}
