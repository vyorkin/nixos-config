{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # skype
    slack
    slack-term
    discord
    zoom-us
    tdesktop
    # telegram-cli
    # pidgin
    # gitter
  ];
}
