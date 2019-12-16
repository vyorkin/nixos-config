{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # skype
    slack
    slack-term
    discord
    zoom-us
    tdesktop
    spectral
    riot-desktop
    # telegram-cli
    # pidgin
    gitter
  ];
}
