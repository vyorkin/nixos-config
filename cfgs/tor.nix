{ pkgs, ... }:

{
  services.tor = {
    enable = true;
    enableGeoIP = true;
    client.enable = true;
  };

  environment.systemPackages = with pkgs; [
    torbrowser
    # tor
    # tor-arm
  ];
}
