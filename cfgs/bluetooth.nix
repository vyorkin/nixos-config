{ pkgs, ... }:

# Docs: https://nixos.wiki/wiki/Bluetooth

{
  # Enable support for Bluetooth devices
  hardware.bluetooth = {
    enable = true;

    # Enable all bluez plugins
    package = pkgs.bluezFull;

    # Modern headsets will generally try to connect using the A2DP profile
    # To enable this we need to add the following lines:
    config = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    blueman
  ];

  # Enable the blueman service, which provides
  # blueman-applet and blueman-manager
  services.blueman.enable = true;
  # Note that blueman-applet is currently
  # started by the i3 window manager
}
