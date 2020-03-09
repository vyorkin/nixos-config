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

    # torbrowser
    tor
    # tor-arm
    # tor-browser-bundle-bin

    rtv
  ];
}
