{ pkgs, ... }:

let telega-server = pkgs.callPackage ../pkgs/custom/telega-server { };
in {
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
    telega-server
  ];
}
