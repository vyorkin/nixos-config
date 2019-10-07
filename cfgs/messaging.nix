{ pkgs, ... }:

let telega-server = pkgs.callPackage ../pkgs/custom/telega-server { };
in {
  environment.systemPackages = with pkgs; [
    skype
    slack
    slack-term
    discord
    zoom-us
    telega-server
    tdesktop
    # telegram-cli
    # pidgin
    # gitter
  ];
}
