{ pkgs, ... }:

{
  services.tor = {
    enable = true;
    enableGeoIP = true;
    client.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # chromium
    google-chrome

    firefox
    shadowfox
    brave

    # lynx
    # w3m

    qutebrowser

    ddgr
    browsh

    rtv

    # tor-browser-bundle-bin
    # torbrowser

    # tor
    # tor-arm

  ];
}
