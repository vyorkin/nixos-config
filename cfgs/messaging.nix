{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # skype
    slack
    tdesktop
    telegram-cli
    pidgin
    discord
    riot-web
  # franz
    gitter
    zoom-us
  ];
}
