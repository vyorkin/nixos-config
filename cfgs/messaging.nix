{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    skype
    slack
    tdesktop
    telegram-cli
    discord
    zoom-us
  ];
}
