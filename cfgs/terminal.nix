{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    kitty
    hyper
    guake
    eternal-terminal
    cool-retro-term
    # rxvt_unicode-with-plugins

    # https://starship.rs/
    starship

    cmatrix
    pipes
  ];
}
