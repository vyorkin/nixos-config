{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    skype
    slack
    slack-term
    discord
    zoom-us
    tdesktop
    nheko
    spectral
    # element-desktop
    # telegram-cli
    # pidgin
    gitter

    # A chat client for Twitch chat
    chatterino2
  ];
}
