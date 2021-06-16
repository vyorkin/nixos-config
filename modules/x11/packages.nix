{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    xcape
  ];
}
