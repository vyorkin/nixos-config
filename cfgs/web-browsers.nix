{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    google-chrome

    firefox
    shadowfox

    # lynx
    # w3m

    qutebrowser
  ];
}
