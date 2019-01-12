{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    skype
    slack
    tdesktop
    telegram-cli
    pidgin
    discord
  # gitter
    zoom-us
  ];
}
