{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    skype
    slack
    tdesktop
    telegram-cli
    zoom-us
  ];
}
