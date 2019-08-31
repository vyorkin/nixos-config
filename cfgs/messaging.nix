{ pkgs, ... }:

let telega-server = pkgs.callPackage ../pkgs/custom/telega-server { };
in {
  environment.systemPackages = with pkgs; [
    skype
    slack
    tdesktop
    # telegram-cli
    pidgin
    discord
    gitter
    zoom-us
    telega-server
  ];
}
