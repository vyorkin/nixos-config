{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    google-chrome

    firefox
    shadowfox
    brave

    # lynx
    # w3m

    qutebrowser
  ];
}
