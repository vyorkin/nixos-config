{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    kitty
    eternal-terminal
    rxvt_unicode-with-plugins
  ];
}
