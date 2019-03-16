{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    skype
    slack
    tdesktop
    telegram-cli
    pidgin
    discord
  # franz
  # gitter
    zoom-us
  ];
}
