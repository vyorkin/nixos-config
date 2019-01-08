{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    eternal-terminal
    rxvt_unicode-with-plugins
  ];
}
