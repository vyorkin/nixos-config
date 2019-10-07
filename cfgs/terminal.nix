{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    kitty
    guake
    eternal-terminal
    rxvt_unicode-with-plugins

    # https://starship.rs/
    starship
  ];
}
